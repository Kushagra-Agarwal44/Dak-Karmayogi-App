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
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    @JsonKey(name: 'CONTACTNO') String? contactNo,
    String? division,
    String? region,
    String? circle,
  }) = _ProfileUser;

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(_normalizeJson(json));
}


Map<String, dynamic> _normalizeJson(Map<String, dynamic> json) {
  return {
    ...json,
    'CONTACTNO': json['CONTACTNO']?.toString(),
  };
}
