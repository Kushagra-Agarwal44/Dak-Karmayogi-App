import 'package:dak_karmayogi_app/features/auth/data/models/auth_state.dart';
import 'package:dak_karmayogi_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dak_karmayogi_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final repository = ref.read(authRepositoryProvider);
    return AuthController(repository);
  },
);

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthController(this.repository) : super(const AuthState.initial()) {
    _checkAuthStatus();
  }



// ❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌❌
// _checkAuthStatus() trusts token blindly
// ❌ This is NOT production safe.

// Token might:

// Be expired

// Be revoked

// Be invalid

// You must validate it with /refresh.


  // Future<void> _checkAuthStatus() async {
  //   state = const AuthState.loading();
  //   final token = await repository.getAccessToken();

  //   if (token == null) {
  //     state = const AuthState.unauthenticated();
  //     return;
  //   }

  //   // For now, we trust token exists.
  //   // Later we can validate by calling profile API.
  //   // state = const AuthState.loading();

  //   try {
  //     // You could decode token here if needed.
  //     // For now, mark authenticated without userId.
  //     state = const AuthState.authenticated(userId: 0, username: "");
  //   } catch (e) {
  //     state = const AuthState.unauthenticated();
  //   }


  // }



Future<void> _checkAuthStatus() async {
  state = const AuthState.loading();

  try {
    final success = await repository.validateSession();

    if (success != null) {
      state = AuthState.authenticated(
        userId: success.id,
        username: success.username,
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  } catch (_) {
    state = const AuthState.unauthenticated();
  }
}



  Future<void> login(String id, String password) async {
    state = const AuthState.loading();

    try {
      final user = await repository.login(userId: id, password: password);

      state = AuthState.authenticated(
        userId: user.id,
        username: user.username,
      );
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    await repository.logout();
    state = const AuthState.unauthenticated();
  }
}
