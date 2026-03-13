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

  Future<bool> updateProfile(Map<String, dynamic> payload) async {
    state = state.copyWith(isUpdating: true, updateError: null);
    try {
      await repository.updateProfile(payload);
      // Re-fetch the entire profile to perfectly sync local state with DB
      await fetchProfileData(); 
      state = state.copyWith(isUpdating: false);
      return true;
    } catch (e) {
      state = state.copyWith(isUpdating: false, updateError: e.toString());
      return false;
    }
  }
}

// Global providers to fetch cascading dropdown data easily
final profileRepositoryGetter = Provider((ref) => ref.read(profileRepositoryProvider));