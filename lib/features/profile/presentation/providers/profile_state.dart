// lib/features/profile/presentation/providers/profile_state.dart

import 'package:dak_karmayogi_app/features/profile/domain/entities/interest.dart';
import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    ProfileEntity? profile,
    List<FieldOfInterestEntity>? interests,
    @Default(false) bool isLoading,
    String? error,
  }) = _ProfileState;
}