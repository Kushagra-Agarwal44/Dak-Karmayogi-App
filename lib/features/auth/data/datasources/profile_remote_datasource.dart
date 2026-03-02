import 'package:dak_karmayogi_app/features/profile/data/models/profile_response.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSource {
  final Dio _dio;

  ProfileRemoteDataSource(this._dio);

  Future<ProfileResponse> getProfile() async {
    final response = await _dio.get("/profile");
    return ProfileResponse.fromJson(response.data);
  }
}