import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.authenticated({
    required int userId,
    required String username,
    required String loginMode,
  }) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.error(String message) = _Error;
}

extension AuthStateX on AuthState {
  bool get isAuthenticated => maybeWhen(authenticated: (_, __, ___) => true, orElse: () => false);
  bool get isLoading => maybeWhen(initial: () => true, loading: () => true, orElse: () => false);
  int? get userId => maybeWhen(authenticated: (id, _, __) => id, orElse: () => null);
  String? get username => maybeWhen(authenticated: (_, username, __) => username, orElse: () => null);
  String? get loginMode => maybeWhen(authenticated: (_, __, mode) => mode, orElse: () => null); // Added
}
