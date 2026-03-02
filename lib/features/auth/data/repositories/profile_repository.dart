
import 'package:dak_karmayogi_app/features/auth/data/datasources/profile_remote_datasource.dart';
import 'package:dak_karmayogi_app/features/auth/domain/entities/app_user.dart';

class ProfileRepository {
  final ProfileRemoteDataSource _remote;

  ProfileRepository(this._remote);

  Future<AppUser> getProfile() async {
    final response = await _remote.getProfile();
    final user = response.data.user;

    return AppUser(
      id: user.studentId,
      fullName: "${user.firstname} ${user.lastname}".trim(),
      username: user.username,
      email: user.email,
      // photoUrl: user.location,
      division: user.division,
      region: user.region,
      circle: user.circle,
      // address: user.address,
      phone: user.contactNo?.toString(),
      // gender: user.gender,
      // qualification: user.qualification,
      // bloodGroup: user.bloodGroup,
    );
  }
}