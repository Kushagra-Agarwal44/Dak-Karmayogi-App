// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserProfileModelImpl(
  studentId: (json['student_id'] as num?)?.toInt(),
  firstname: json['firstname'] as String?,
  lastname: json['lastname'] as String?,
  aadhaarNumber: json['aadhaar_number'] as String?,
  dateOfJoining: json['date_of_joining'] as String?,
  dateOfJoiningCc: json['date_of_joining_cc'] as String?,
  username: json['username'] as String?,
  dob: json['DOB'] as String?,
  gender: json['GENDER'] as String?,
  caste: json['CASTE'] as String?,
  qualification: json['QUALIFICATION'] as String?,
  contactNo: (json['CONTACTNO'] as num?)?.toInt(),
  division: json['division'] as String?,
  region: json['region'] as String?,
  circle: json['circle'] as String?,
  address: json['address'] as String?,
  cadreStatus: json['cadre_status'] as String?,
  hobby: json['hobby'] as String?,
  knowComputer: json['know_computer'] as String?,
  bloodGroup: json['blood_group'] as String?,
  identification: json['identification'] as String?,
  medicalHistory: json['medical_history'] as String?,
  email: json['email'] as String?,
  emergencyCName: json['emergency_c_name'] as String?,
  emergencyCRelation: json['emergency_c_relation'] as String?,
  emergencyCNo: json['emergency_c_no'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$$UserProfileModelImplToJson(
  _$UserProfileModelImpl instance,
) => <String, dynamic>{
  'student_id': instance.studentId,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'aadhaar_number': instance.aadhaarNumber,
  'date_of_joining': instance.dateOfJoining,
  'date_of_joining_cc': instance.dateOfJoiningCc,
  'username': instance.username,
  'DOB': instance.dob,
  'GENDER': instance.gender,
  'CASTE': instance.caste,
  'QUALIFICATION': instance.qualification,
  'CONTACTNO': instance.contactNo,
  'division': instance.division,
  'region': instance.region,
  'circle': instance.circle,
  'address': instance.address,
  'cadre_status': instance.cadreStatus,
  'hobby': instance.hobby,
  'know_computer': instance.knowComputer,
  'blood_group': instance.bloodGroup,
  'identification': instance.identification,
  'medical_history': instance.medicalHistory,
  'email': instance.email,
  'emergency_c_name': instance.emergencyCName,
  'emergency_c_relation': instance.emergencyCRelation,
  'emergency_c_no': instance.emergencyCNo,
  'location': instance.location,
};

_$FieldOfInterestModelImpl _$$FieldOfInterestModelImplFromJson(
  Map<String, dynamic> json,
) => _$FieldOfInterestModelImpl(
  id: (json['id'] as num).toInt(),
  interestedField: json['interested_field'] as String,
  interested: json['interested'] as String,
);

Map<String, dynamic> _$$FieldOfInterestModelImplToJson(
  _$FieldOfInterestModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'interested_field': instance.interestedField,
  'interested': instance.interested,
};
