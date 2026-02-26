import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/features/profile/data/models/profile_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/login_response.dart';

final authRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  final storage = ref.read(secureStorageProvider);
  return AuthRepository(dio, storage);
});

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<LoginResponse?>>(
        (ref) {
  return AuthController(ref.read(authRepositoryProvider));
});

class AuthController
    extends StateNotifier<AsyncValue<LoginResponse?>> {
  final AuthRepository _repository;

  AuthController(this._repository)
      : super(const AsyncValue.data(null));

  Future<void> login(String username, String password) async {
    state = const AsyncValue.loading();

    try {
      final response =
          await _repository.login(username: username, password: password);

      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

Future<ProfileUser> fetchProfile() async {
  return await _repository.getProfile();
}


}
