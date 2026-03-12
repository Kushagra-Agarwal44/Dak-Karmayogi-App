// lib/features/profile/domain/entities/profile_entity.dart

class ProfileEntity {
  final int? studentId;
  final String? firstname;
  final String? lastname;
  final String? aadhaarNumber;
  final String? dateOfJoining;
  final String? dateOfJoiningCc;
  final String? username;
  final String? dob;
  final String? gender;
  final String? caste;
  final String? qualification;
  final int? contactNo;
  final String? division;
  final String? region;
  final String? circle;
  final String? address;
  final String? cadreStatus;
  final String? hobby;
  final String? knowComputer;
  final String? bloodGroup;
  final String? identification;
  final String? medicalHistory;
  final String? email;
  final String? emergencyCName;
  final String? emergencyCRelation;
  final String? emergencyCNo;
  final String? location;

  const ProfileEntity({
    this.studentId,
    this.firstname,
    this.lastname,
    this.aadhaarNumber,
    this.dateOfJoining,
    this.dateOfJoiningCc,
    this.username,
    this.dob,
    this.gender,
    this.caste,
    this.qualification,
    this.contactNo,
    this.division,
    this.region,
    this.circle,
    this.address,
    this.cadreStatus,
    this.hobby,
    this.knowComputer,
    this.bloodGroup,
    this.identification,
    this.medicalHistory,
    this.email,
    this.emergencyCName,
    this.emergencyCRelation,
    this.emergencyCNo,
    this.location,
  });
}