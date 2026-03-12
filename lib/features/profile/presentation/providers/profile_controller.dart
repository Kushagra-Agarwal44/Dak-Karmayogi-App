// lib/features/profile/presentation/providers/profile_provider.dart

import 'package:dak_karmayogi_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/profile_repository.dart';
import 'profile_state.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>((ref) {
  final repository = ref.read(profileRepositoryProvider);
  return ProfileController(repository);
});

class ProfileController extends StateNotifier<ProfileState> {
  final ProfileRepository repository;

  ProfileController(this.repository) : super(const ProfileState()) {
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final profileResponse = await repository.getProfile();
      final interestsResponse = await repository.getFieldOfInterests();
      state = state.copyWith(
        profile: profileResponse,
        interests: interestsResponse,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}