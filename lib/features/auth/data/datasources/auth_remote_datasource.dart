import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/features/auth/data/models/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String username,
    required String password,
    required String loginMode,
  });
  Future<LoginResponseModel> refreshToken(String refreshToken);
}

final authRemoteDataSourceProvider = Provider((ref){
  final dio = ref.read(dioProvider);
  return AuthRemoteDatasourceImpl(dio);
});


class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login({
    required String username,
    required String password,
    required String loginMode
  }) async {
    print("kam se kam request initiate hui remotedatasource me ");

    try {
  final response = await dio.post(
    "/login",
    data: {
      "username": username,
      "password": password,
      "login_mode": loginMode,
    },
  );

  print("RAW RESPONSE: ${response.data}");
  return LoginResponseModel.fromJson(response.data);
} catch (e, stack) {
  print("DIO ERROR: $e");
  print("STACK: $stack");
  rethrow;
}
  }

@override
  Future<LoginResponseModel> refreshToken(String refreshToken) async {
  final response = await dio.post(
    "/refresh",
    data: {
      "refresh_token": refreshToken,
    },
  );

  return LoginResponseModel.fromJson(response.data);
}
}
