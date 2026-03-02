import 'package:dak_karmayogi_app/core/network/auth_interceptor.dart';
import 'package:dak_karmayogi_app/core/storage/secure_storage_service.dart';
import 'package:dio/dio.dart';

class DioClient {
  final SecureStorageService _storage;

  late final Dio dio;

  DioClient(this._storage) {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://dakkarmayogi.gov.in:8443/testing/api",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      AuthInterceptor(_storage, dio),
    );
  }
}