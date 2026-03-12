// lib/features/profile/data/repositories/profile_repository_impl.dart

import 'package:dak_karmayogi_app/features/profile/domain/entities/interest.dart';
import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final remoteDataSource = ref.read(profileRemoteDataSourceProvider);
  return ProfileRepositoryImpl(remoteDataSource);
});

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProfileEntity> getProfile() async {
    final model = await remoteDataSource.getProfile();
    return model.toEntity();
  }

  @override
  Future<List<FieldOfInterestEntity>> getFieldOfInterests() async {
    final models = await remoteDataSource.getFieldOfInterests();
    return models.map((model) => model.toEntity()).toList();
  }
}