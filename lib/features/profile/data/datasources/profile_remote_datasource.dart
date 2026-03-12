// lib/features/profile/data/datasources/profile_remote_datasource.dart

import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/profile_model.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return ProfileRemoteDataSourceImpl(dio);
});

abstract class ProfileRemoteDataSource {
  Future<UserProfileModel> getProfile();
  Future<List<FieldOfInterestModel>> getFieldOfInterests();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<UserProfileModel> getProfile() async {
    final response = await dio.get('/profile');
    if (response.data['success'] == true) {
      return UserProfileModel.fromJson(response.data['data']['user']);
    } else {
      throw Exception(response.data['message'] ?? 'Failed to load profile');
    }
  }

  @override
  Future<List<FieldOfInterestModel>> getFieldOfInterests() async {
    final response = await dio.get('/profile-field-interest');
    if (response.data['success'] == true) {
      return (response.data['data'] as List)
          .map((item) => FieldOfInterestModel.fromJson(item))
          .toList();
    } else {
      throw Exception(response.data['message'] ?? 'Failed to load interests');
    }
  }
}