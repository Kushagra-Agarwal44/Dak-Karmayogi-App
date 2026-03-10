import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/core/storage/secure_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _storage;
  final Dio _dio;
  final Ref _ref;
  bool isRefreshing = false;
  // Moved to class level so it acts as a true lock across multiple concurrent errors
  AuthInterceptor(this._storage, this._dio, this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;

    // If it's a token error, not already refreshing, and not the refresh endpoint itself
    if ((status == 401 || status == 402) &&
        err.requestOptions.path != "/refresh" &&
        !isRefreshing) {
      isRefreshing = true;

      try {
        final refreshToken = await _storage.getRefreshToken();

        if (refreshToken == null) {
          await _storage.clear();
          _ref.read(sessionExpiredProvider.notifier).state = true;
          return handler.next(err);
        }

        // Use a new Dio instance without interceptors to avoid infinite loops
        final refreshDio = Dio(BaseOptions(baseUrl: _dio.options.baseUrl));

        final response = await refreshDio.post(
          "/refresh",
          data: {"refresh_token": refreshToken},
        );

        final newAccessToken = response.data["data"]["access_token"];
        // Might be null based on new API
        final newRefreshToken = response.data["data"]["refresh_token"];

        await _storage.saveTokens(
          accessToken: newAccessToken,
          // FIX: Preserve the existing token if a new one wasn't provided
          refreshToken: newRefreshToken ?? refreshToken,
        );

        // Update the failed request with the new token
        final requestOptions = err.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        // Retry the failed request silently
        final clonedResponse = await _dio.fetch(requestOptions);

        return handler.resolve(clonedResponse);
      } catch (_) {
        await _storage.clear();
        _ref.read(sessionExpiredProvider.notifier).state = true;
      } finally {
        isRefreshing = false;
      }
    }
    // Pass the error onward if we couldn't handle it
    handler.next(err);
  }
}
