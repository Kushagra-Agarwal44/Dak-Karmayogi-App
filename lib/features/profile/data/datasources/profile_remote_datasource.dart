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
  Future<void> updateProfile(Map<String, dynamic> payload);
  
  // Dropdown Lists
  Future<List<String>> getCircleList();
  Future<List<String>> getRegionList(String circle);
  Future<List<String>> getDivisionList(String circle, String region);
  Future<List<String>> getBloodGroupList();
  Future<List<String>> getQualificationList();
  Future<List<String>> getCategoryList();
  Future<List<String>> getRelationList();
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

  @override
  Future<void> updateProfile(Map<String, dynamic> payload) async {
    final response = await dio.post('/profile-update', data: payload);
    if (response.data['success'] != true) {
      throw Exception(response.data['message'] ?? 'Failed to update profile');
    }
  }

  @override
  Future<List<String>> getCircleList() async {
    final response = await dio.post('/circle-list');
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e['circle_name'].toString()).toList();
    }
    return [];
  }

  @override
  Future<List<String>> getRegionList(String circle) async {
    final response = await dio.post('/region-list', data: {"circle": circle});
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e['region_name'].toString()).toList();
    }
    return [];
  }

  @override
  Future<List<String>> getDivisionList(String circle, String region) async {
    final response = await dio.post('/division-list', data: {"circle": circle, "region": region});
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e['division_name'].toString()).toList();
    }
    return [];
  }

  @override
  Future<List<String>> getBloodGroupList() async {
    final response = await dio.post('/blood-group-list');
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e.toString()).toList();
    }
    return [];
  }

  @override
  Future<List<String>> getQualificationList() async {
    final response = await dio.post('/qualification-list');
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e['edu_qual'].toString()).toList();
    }
    return [];
  }

  @override
  Future<List<String>> getCategoryList() async {
    final response = await dio.post('/cast-category-list');
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e.toString()).toList();
    }
    return [];
  }

  @override
  Future<List<String>> getRelationList() async {
    final response = await dio.post('/relation-list');
    if (response.data['success'] == true) {
      return (response.data['data'] as List).map((e) => e.toString()).toList();
    }
    return [];
  }
}