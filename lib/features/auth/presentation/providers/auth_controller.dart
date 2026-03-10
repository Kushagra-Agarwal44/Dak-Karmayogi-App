import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/features/auth/data/models/auth_state.dart';
import 'package:dak_karmayogi_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dak_karmayogi_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final repository = ref.read(authRepositoryProvider);
    return AuthController(repository, ref);
  },
);

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthController(this.repository, Ref ref) : super(const AuthState.initial()) {
    ref.listen<bool>(sessionExpiredProvider, (previous, next) {
      if (next == true) {
        logout();
        // FIX: Safely update provider state outside the build cycle
        Future.microtask(() {
          ref.read(sessionExpiredProvider.notifier).state = false;
        });
      }
    });

    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    state = const AuthState.loading();

    try {
      final success = await repository.validateSession();

      if (success != null) {
        state = AuthState.authenticated(
          userId: success.id,
          username: success.username,
          loginMode: success.loginMode,
        );
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (_) {
      state = const AuthState.unauthenticated();
    }
  }

  
  void onSessionExpired() {
    logout();
  }

  Future<void> login(String id, String password, String loginMode) async {
    state = const AuthState.loading();

    try {
      final user = await repository.login(username: id, password: password, loginMode: loginMode);

      state = AuthState.authenticated(userId: user.id, username: user.username, loginMode: user.loginMode);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    await repository.logout();
    state = const AuthState.unauthenticated();
  }
}
