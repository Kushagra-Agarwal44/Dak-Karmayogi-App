import 'package:dio/dio.dart';
import '../storage/secure_storage_service.dart';

class DioClient {
  final Dio dio;

  DioClient(SecureStorageService storage)
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://dakkarmayogi.gov.in:8443/api",
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.getAccessToken();

          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
      ),
    );
  }
}
