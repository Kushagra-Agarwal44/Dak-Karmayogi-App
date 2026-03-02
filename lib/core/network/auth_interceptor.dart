import 'package:dak_karmayogi_app/core/storage/secure_storage_service.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService _storage;
  final Dio _dio;

  AuthInterceptor(this._storage, this._dio);

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
    print("ERROR STATUS: ${err.response?.statusCode}");
    print("ERROR PATH: ${err.requestOptions.path}");
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await _storage.getRefreshToken();

        if (refreshToken == null) {
          await _storage.clear();
          return handler.next(err);
        }
        //  ❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌
        //⚠️ _dio already has the interceptor attached.

        // If /refresh returns 401 → infinite recursion possible.

        // Call refresh API
        final response = await _dio.post(
          "/refresh",
          data: {"refreshToken": refreshToken},
        );

        final newAccessToken = response.data["accessToken"];
        final newRefreshToken = response.data["refreshToken"];

        // Save new tokens
        await _storage.saveTokens(
          accessToken: newAccessToken,
          refreshToken: newRefreshToken,
        );

        // Retry original request
        final requestOptions = err.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final clonedResponse = await _dio.fetch(requestOptions);

        return handler.resolve(clonedResponse);
      } catch (_) {
        await _storage.clear();
      }
    }

    handler.next(err);
  }
}



// ❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌
//When refresh fails:

// await _storage.clear();

// But UI is never informed.

// Router won’t know.

// User will still think he’s logged in.

// ✅ STEP 5 — Fix Interceptor (VERY IMPORTANT)

// We remove refresh logic from interceptor.

// Why?

// Because:

// 👉 We now validate session at app start
// 👉 Interceptor should only handle expired access token during runtime

// Production pattern:

// Interceptor refreshes silently

// If refresh fails → trigger logout via callback
