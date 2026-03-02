import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/features/auth/data/models/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String userId,
    required String password,
  });
}

final AuthRemoteDataSourceProvider = Provider((ref){
  final dio = ref.read(dioProvider);
  return AuthRemoteDatasourceImpl(dio);
});


class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDatasourceImpl(this.dio);

  @override
  Future<LoginResponseModel> login({
    required String userId,
    required String password,
  }) async {
    print("kam se kam request initiate hui remotedatasource me ");
    // final response = await dio.post(
    //   '/login',
    //   data: {"username": userId, "password": password},
    // );
    // return LoginResponseModel.fromJson(response.data);



    try {
  final response = await dio.post(
    "/login",
    data: {
      "username": userId,
      "password": password,
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
