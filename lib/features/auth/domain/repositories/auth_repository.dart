import 'package:dak_karmayogi_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String userId, required String password});
  Future<User?> validateSession();
  Future<void> logout();
  Future<String?> getAccessToken();
  Future<String?> getStoredUserId();
  Future<String?> getStoredUsername();
}
