class AppUser {
  final int id;
  final String fullName;
  final String? username;
  final String? email;
  final String? photoUrl;
  final String? division;
  final String? region;
  final String? circle;
  final String? address;
  final String? phone;
  final String? gender;
  final String? qualification;
  final String? bloodGroup;

  AppUser({
    required this.id,
    required this.fullName,
    required this.username,
    this.email,
    this.photoUrl,
    this.division,
    this.region,
    this.circle,
    this.address,
    this.phone,
    this.gender,
    this.qualification,
    this.bloodGroup,
  });
}