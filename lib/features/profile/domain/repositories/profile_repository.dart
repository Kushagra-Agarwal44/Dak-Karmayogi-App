// lib/features/profile/domain/repositories/profile_repository.dart

import 'package:dak_karmayogi_app/features/profile/domain/entities/interest.dart';
import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';


abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();
  Future<List<FieldOfInterestEntity>> getFieldOfInterests();
}