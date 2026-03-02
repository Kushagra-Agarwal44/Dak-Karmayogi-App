import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.authenticated({
    required int userId,
    required String username,
  }) = _Authenticated;

  const factory AuthState.unauthenticated() = _Unauthenticated;

  const factory AuthState.error(String message) = _Error;
}

extension AuthStateX on AuthState {
  bool get isAuthenticated =>
      maybeWhen(
        authenticated: (_, __) => true,
        orElse: () => false,
      );

  bool get isLoading =>
      maybeWhen(
        initial: () => true,
        loading: () => true,
        orElse: () => false,
      );

  int? get userId =>
      maybeWhen(
        authenticated: (id, _) => id,
        orElse: () => null,
      );

  String? get username =>
      maybeWhen(
        authenticated: (_, username) => username,
        orElse: () => null,
      );
}