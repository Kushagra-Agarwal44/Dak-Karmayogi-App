import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  static const _accessTokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token";
  static const _expiryKey = "expiry_time";

  Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
  }) async {
    final expiryTime =
        DateTime.now().add(Duration(seconds: expiresIn)).millisecondsSinceEpoch;

    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    await _storage.write(key: _expiryKey, value: expiryTime.toString());
  }

  Future<String?> getAccessToken() =>
      _storage.read(key: _accessTokenKey);

  Future<String?> getRefreshToken() =>
      _storage.read(key: _refreshTokenKey);

  Future<bool> isTokenExpired() async {
    final expiry = await _storage.read(key: _expiryKey);
    if (expiry == null) return true;

    final expiryTime = int.parse(expiry);
    return DateTime.now().millisecondsSinceEpoch > expiryTime;
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

