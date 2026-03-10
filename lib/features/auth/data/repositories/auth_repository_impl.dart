import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/core/storage/secure_storage_service.dart';
import 'package:dak_karmayogi_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dak_karmayogi_app/features/auth/data/models/user_model.dart';
import 'package:dak_karmayogi_app/features/auth/domain/entities/user.dart';
import 'package:dak_karmayogi_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final storage = ref.read(secureStorageProvider);
  final dataSource = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(dataSource, storage);
});

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService secureStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.secureStorage);

  @override
  Future<User> login({
    required String username,
    required String password,
    required String loginMode,
  }) async {
    final response = await remoteDataSource.login(
      username: username,
      password: password,
      loginMode: loginMode,
    );
    print("ye response aaya hai ${response.toString()}");
    await secureStorage.saveTokens(
      // accessToken: response.accessToken,
      // refreshToken: response.refreshToken,
      accessToken: response.data.accessToken,
      refreshToken: response.data.refreshToken ?? "",
    );

    return response.data.user.toEntity();
  }

  @override
  Future<void> logout() async {
    await secureStorage.clear();
  }

  @override
  Future<String?> getAccessToken() async {
    return await secureStorage.getAccessToken();
  }

  @override
  Future<String?> getStoredUserId() {
    // TODO: implement getStoredUserId
    throw UnimplementedError();
  }

  @override
  Future<String?> getStoredUsername() {
    // TODO: implement getStoredUsername
    throw UnimplementedError();
  }

  @override
  Future<User?> validateSession() async {
    final currentRefreshToken = await secureStorage.getRefreshToken();

    if (currentRefreshToken == null) {
      return null;
    }

    try {
      final response = await remoteDataSource.refreshToken(currentRefreshToken);

      await secureStorage.saveTokens(
        accessToken: response.data.accessToken,
        // FIX: If API doesn't return a new refresh token, keep the old one!
        refreshToken: response.data.refreshToken ?? currentRefreshToken,
      );

      return response.data.user.toEntity();
    } catch (_) {
      await secureStorage.clear();
      return null;
    }
  }
}
