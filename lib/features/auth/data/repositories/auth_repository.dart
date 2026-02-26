import 'package:dak_karmayogi_app/core/storage/secure_storage_service.dart';
import 'package:dak_karmayogi_app/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../models/login_response.dart';

class AuthRepository {
  final Dio _dio;
  final SecureStorageService _storage;

  AuthRepository(this._dio, this._storage);

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          "username": username,
          "password": password,
        },
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      await _storage.saveAuthData(
        accessToken: loginResponse.data.accessToken,
        refreshToken: loginResponse.data.refreshToken,
        expiresIn: loginResponse.data.expiresIn,
      );

      return loginResponse;
    } on DioException catch (e) {
      throw Exception(
          e.response?.data['message'] ?? "Login failed");
    }
  }


Future<ProfileUser> getProfile() async {
  try {
    final response = await _dio.get('/profile');

    final profile =
        ProfileResponse.fromJson(response.data);

    return profile.data.user;
  } on DioException catch (e) {
    throw Exception(
        e.response?.data['message'] ?? "Failed to fetch profile");
  }
}




}
