// import 'dart:nativewrappers/_internal/vm/bin/common_patch.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/dio_client.dart';
import '../storage/secure_storage_service.dart';
import 'package:dio/dio.dart';

final secureStorageProvider =
    Provider((ref) => SecureStorageService());

final dioProvider = Provider<Dio>((ref) {
  final storage = ref.read(secureStorageProvider);
  return DioClient(storage).dio;
});
