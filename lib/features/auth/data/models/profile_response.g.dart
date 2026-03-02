// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileResponseImpl _$$ProfileResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProfileResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$$ProfileResponseImplToJson(
  _$ProfileResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'status': instance.status,
};

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      user: ProfileUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{'user': instance.user};

_$ProfileUserImpl _$$ProfileUserImplFromJson(Map<String, dynamic> json) =>
    _$ProfileUserImpl(
      studentId: (json['student_id'] as num).toInt(),
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
      location: json['location'] as String?,
      division: json['division'] as String?,
      region: json['region'] as String?,
      circle: json['circle'] as String?,
      address: json['address'] as String?,
      contactNo: (json['CONTACTNO'] as num?)?.toInt(),
      dob: json['DOB'] as String?,
      gender: json['GENDER'] as String?,
      caste: json['CASTE'] as String?,
      qualification: json['QUALIFICATION'] as String?,
      bloodGroup: json['blood_group'] as String?,
      about: json['about'] as String?,
    );

Map<String, dynamic> _$$ProfileUserImplToJson(_$ProfileUserImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.username,
      'email': instance.email,
      'location': instance.location,
      'division': instance.division,
      'region': instance.region,
      'circle': instance.circle,
      'address': instance.address,
      'CONTACTNO': instance.contactNo,
      'DOB': instance.dob,
      'GENDER': instance.gender,
      'CASTE': instance.caste,
      'QUALIFICATION': instance.qualification,
      'blood_group': instance.bloodGroup,
      'about': instance.about,
    };
