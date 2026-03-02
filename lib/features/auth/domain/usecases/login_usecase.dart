import 'package:dak_karmayogi_app/features/auth/domain/entities/user.dart';
import 'package:dak_karmayogi_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call({
    required String userId,
    required String password,
  }) {
    return repository.login(
      userId: userId,
      password: password,
    );
  }
}