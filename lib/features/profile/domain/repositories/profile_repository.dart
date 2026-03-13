// lib/features/profile/domain/repositories/profile_repository.dart

import 'package:dak_karmayogi_app/features/profile/domain/entities/interest.dart';
import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();
  Future<List<FieldOfInterestEntity>> getFieldOfInterests();
  Future<void> updateProfile(Map<String, dynamic> payload);
  
  Future<List<String>> getCircleList();
  Future<List<String>> getRegionList(String circle);
  Future<List<String>> getDivisionList(String circle, String region);
  Future<List<String>> getBloodGroupList();
  Future<List<String>> getQualificationList();
  Future<List<String>> getCategoryList();
  Future<List<String>> getRelationList();
}