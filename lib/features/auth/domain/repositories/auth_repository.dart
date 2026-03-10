import 'package:dak_karmayogi_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String username, required String password, required String loginMode});
  Future<User?> validateSession();
  Future<void> logout();
  Future<String?> getAccessToken();
  Future<String?> getStoredUserId();
  Future<String?> getStoredUsername();
}
