// lib/features/profile/data/models/profile_model.dart

import 'package:dak_karmayogi_app/features/profile/domain/entities/interest.dart';
import 'package:dak_karmayogi_app/features/profile/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const UserProfileModel._();

  const factory UserProfileModel({
    @JsonKey(name: 'student_id') int? studentId,
    String? firstname,
    String? lastname,
    @JsonKey(name: 'aadhaar_number') String? aadhaarNumber,
    @JsonKey(name: 'date_of_joining') String? dateOfJoining,
    @JsonKey(name: 'date_of_joining_cc') String? dateOfJoiningCc,
    String? username,
    @JsonKey(name: 'DOB') String? dob,
    @JsonKey(name: 'GENDER') String? gender,
    @JsonKey(name: 'CASTE') String? caste,
    @JsonKey(name: 'QUALIFICATION') String? qualification,
    @JsonKey(name: 'CONTACTNO') int? contactNo,
    String? division,
    String? region,
    String? circle,
    String? address,
    @JsonKey(name: 'cadre_status') String? cadreStatus,
    String? hobby,
    @JsonKey(name: 'know_computer') String? knowComputer,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    String? identification,
    @JsonKey(name: 'medical_history') String? medicalHistory,
    String? email,
    @JsonKey(name: 'emergency_c_name') String? emergencyCName,
    @JsonKey(name: 'emergency_c_relation') String? emergencyCRelation,
    @JsonKey(name: 'emergency_c_no') String? emergencyCNo,
    String? location,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  ProfileEntity toEntity() {
    return ProfileEntity(
      studentId: studentId,
      firstname: firstname,
      lastname: lastname,
      aadhaarNumber: aadhaarNumber,
      dateOfJoining: dateOfJoining,
      dateOfJoiningCc: dateOfJoiningCc,
      username: username,
      dob: dob,
      gender: gender,
      caste: caste,
      qualification: qualification,
      contactNo: contactNo,
      division: division,
      region: region,
      circle: circle,
      address: address,
      cadreStatus: cadreStatus,
      hobby: hobby,
      knowComputer: knowComputer,
      bloodGroup: bloodGroup,
      identification: identification,
      medicalHistory: medicalHistory,
      email: email,
      emergencyCName: emergencyCName,
      emergencyCRelation: emergencyCRelation,
      emergencyCNo: emergencyCNo,
      location: location,
    );
  }
}

@freezed
class FieldOfInterestModel with _$FieldOfInterestModel {
  const FieldOfInterestModel._();

  const factory FieldOfInterestModel({
    required int id,
    @JsonKey(name: 'interested_field') required String interestedField,
    required String interested,
  }) = _FieldOfInterestModel;

  factory FieldOfInterestModel.fromJson(Map<String, dynamic> json) =>
      _$FieldOfInterestModelFromJson(json);

  FieldOfInterestEntity toEntity() {
    return FieldOfInterestEntity(
      id: id,
      interestedField: interestedField,
      interested: interested,
    );
  }
}