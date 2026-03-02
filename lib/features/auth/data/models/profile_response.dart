import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required bool success,
    required String message,
    required ProfileData data,
    required int status,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    required ProfileUser user,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
class ProfileUser with _$ProfileUser {
  const factory ProfileUser({
    @JsonKey(name: 'student_id') required int studentId,
    required String firstname,
    required String lastname,
    required String username,
    required String? email,
    required String? location,
    required String? division,
    required String? region,
    required String? circle,
    required String? address,
    @JsonKey(name: 'CONTACTNO') required int? contactNo,
    @JsonKey(name: 'DOB') required String? dob,
    @JsonKey(name: 'GENDER') required String? gender,
    @JsonKey(name: 'CASTE') required String? caste,
    @JsonKey(name: 'QUALIFICATION') required String? qualification,
    @JsonKey(name: 'blood_group') required String? bloodGroup,
    required String? about,
  }) = _ProfileUser;

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(json);
}