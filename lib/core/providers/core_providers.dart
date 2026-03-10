import 'package:dak_karmayogi_app/core/network/dio_client.dart';
import 'package:dak_karmayogi_app/core/storage/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService(const FlutterSecureStorage());
});

final dioClientProvider = Provider<Dio>((ref) {
  final storage = ref.read(secureStorageProvider);
  final dioClient = DioClient(storage, ref);
  return dioClient.dio;
});

final dioProvider = Provider<Dio>((ref) {
  return ref.read(dioClientProvider);
});

final sessionExpiredProvider = StateProvider<bool>((ref) => false);
