// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return _ProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProfileData get data => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  /// Serializes this ProfileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileResponseCopyWith<ProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileResponseCopyWith<$Res> {
  factory $ProfileResponseCopyWith(
    ProfileResponse value,
    $Res Function(ProfileResponse) then,
  ) = _$ProfileResponseCopyWithImpl<$Res, ProfileResponse>;
  @useResult
  $Res call({bool success, String message, ProfileData data, int status});

  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res, $Val extends ProfileResponse>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as ProfileData,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res> get data {
    return $ProfileDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileResponseImplCopyWith<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  factory _$$ProfileResponseImplCopyWith(
    _$ProfileResponseImpl value,
    $Res Function(_$ProfileResponseImpl) then,
  ) = __$$ProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ProfileData data, int status});

  @override
  $ProfileDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ProfileResponseImplCopyWithImpl<$Res>
    extends _$ProfileResponseCopyWithImpl<$Res, _$ProfileResponseImpl>
    implements _$$ProfileResponseImplCopyWith<$Res> {
  __$$ProfileResponseImplCopyWithImpl(
    _$ProfileResponseImpl _value,
    $Res Function(_$ProfileResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? status = null,
  }) {
    return _then(
      _$ProfileResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ProfileData,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileResponseImpl implements _ProfileResponse {
  const _$ProfileResponseImpl({
    required this.success,
    required this.message,
    required this.data,
    required this.status,
  });

  factory _$ProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final ProfileData data;
  @override
  final int status;

  @override
  String toString() {
    return 'ProfileResponse(success: $success, message: $message, data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data, status);

  /// Create a copy of ProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileResponseImplCopyWith<_$ProfileResponseImpl> get copyWith =>
      __$$ProfileResponseImplCopyWithImpl<_$ProfileResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileResponseImplToJson(this);
  }
}

abstract class _ProfileResponse implements ProfileResponse {
  const factory _ProfileResponse({
    required final bool success,
    required final String message,
    required final ProfileData data,
    required final int status,
  }) = _$ProfileResponseImpl;

  factory _ProfileResponse.fromJson(Map<String, dynamic> json) =
      _$ProfileResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ProfileData get data;
  @override
  int get status;

  /// Create a copy of ProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileResponseImplCopyWith<_$ProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  ProfileUser get user => throw _privateConstructorUsedError;

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
    ProfileData value,
    $Res Function(ProfileData) then,
  ) = _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call({ProfileUser user});

  $ProfileUserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as ProfileUser,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileUserCopyWith<$Res> get user {
    return $ProfileUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
    _$ProfileDataImpl value,
    $Res Function(_$ProfileDataImpl) then,
  ) = __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileUser user});

  @override
  $ProfileUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
    _$ProfileDataImpl _value,
    $Res Function(_$ProfileDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$ProfileDataImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as ProfileUser,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDataImpl implements _ProfileData {
  const _$ProfileDataImpl({required this.user});

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final ProfileUser user;

  @override
  String toString() {
    return 'ProfileData(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(this);
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData({required final ProfileUser user}) =
      _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  ProfileUser get user;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) {
  return _ProfileUser.fromJson(json);
}

/// @nodoc
mixin _$ProfileUser {
  @JsonKey(name: 'student_id')
  int get studentId => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get division => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get circle => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'CONTACTNO')
  int? get contactNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'DOB')
  String? get dob => throw _privateConstructorUsedError;
  @JsonKey(name: 'GENDER')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'CASTE')
  String? get caste => throw _privateConstructorUsedError;
  @JsonKey(name: 'QUALIFICATION')
  String? get qualification => throw _privateConstructorUsedError;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;

  /// Serializes this ProfileUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileUserCopyWith<ProfileUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUserCopyWith<$Res> {
  factory $ProfileUserCopyWith(
    ProfileUser value,
    $Res Function(ProfileUser) then,
  ) = _$ProfileUserCopyWithImpl<$Res, ProfileUser>;
  @useResult
  $Res call({
    @JsonKey(name: 'student_id') int studentId,
    String firstname,
    String lastname,
    String username,
    String? email,
    String? location,
    String? division,
    String? region,
    String? circle,
    String? address,
    @JsonKey(name: 'CONTACTNO') int? contactNo,
    @JsonKey(name: 'DOB') String? dob,
    @JsonKey(name: 'GENDER') String? gender,
    @JsonKey(name: 'CASTE') String? caste,
    @JsonKey(name: 'QUALIFICATION') String? qualification,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    String? about,
  });
}

/// @nodoc
class _$ProfileUserCopyWithImpl<$Res, $Val extends ProfileUser>
    implements $ProfileUserCopyWith<$Res> {
  _$ProfileUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? username = null,
    Object? email = freezed,
    Object? location = freezed,
    Object? division = freezed,
    Object? region = freezed,
    Object? circle = freezed,
    Object? address = freezed,
    Object? contactNo = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? caste = freezed,
    Object? qualification = freezed,
    Object? bloodGroup = freezed,
    Object? about = freezed,
  }) {
    return _then(
      _value.copyWith(
            studentId: null == studentId
                ? _value.studentId
                : studentId // ignore: cast_nullable_to_non_nullable
                      as int,
            firstname: null == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                      as String,
            lastname: null == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            division: freezed == division
                ? _value.division
                : division // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            circle: freezed == circle
                ? _value.circle
                : circle // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactNo: freezed == contactNo
                ? _value.contactNo
                : contactNo // ignore: cast_nullable_to_non_nullable
                      as int?,
            dob: freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            caste: freezed == caste
                ? _value.caste
                : caste // ignore: cast_nullable_to_non_nullable
                      as String?,
            qualification: freezed == qualification
                ? _value.qualification
                : qualification // ignore: cast_nullable_to_non_nullable
                      as String?,
            bloodGroup: freezed == bloodGroup
                ? _value.bloodGroup
                : bloodGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            about: freezed == about
                ? _value.about
                : about // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileUserImplCopyWith<$Res>
    implements $ProfileUserCopyWith<$Res> {
  factory _$$ProfileUserImplCopyWith(
    _$ProfileUserImpl value,
    $Res Function(_$ProfileUserImpl) then,
  ) = __$$ProfileUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'student_id') int studentId,
    String firstname,
    String lastname,
    String username,
    String? email,
    String? location,
    String? division,
    String? region,
    String? circle,
    String? address,
    @JsonKey(name: 'CONTACTNO') int? contactNo,
    @JsonKey(name: 'DOB') String? dob,
    @JsonKey(name: 'GENDER') String? gender,
    @JsonKey(name: 'CASTE') String? caste,
    @JsonKey(name: 'QUALIFICATION') String? qualification,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    String? about,
  });
}

/// @nodoc
class __$$ProfileUserImplCopyWithImpl<$Res>
    extends _$ProfileUserCopyWithImpl<$Res, _$ProfileUserImpl>
    implements _$$ProfileUserImplCopyWith<$Res> {
  __$$ProfileUserImplCopyWithImpl(
    _$ProfileUserImpl _value,
    $Res Function(_$ProfileUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? studentId = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? username = null,
    Object? email = freezed,
    Object? location = freezed,
    Object? division = freezed,
    Object? region = freezed,
    Object? circle = freezed,
    Object? address = freezed,
    Object? contactNo = freezed,
    Object? dob = freezed,
    Object? gender = freezed,
    Object? caste = freezed,
    Object? qualification = freezed,
    Object? bloodGroup = freezed,
    Object? about = freezed,
  }) {
    return _then(
      _$ProfileUserImpl(
        studentId: null == studentId
            ? _value.studentId
            : studentId // ignore: cast_nullable_to_non_nullable
                  as int,
        firstname: null == firstname
            ? _value.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String,
        lastname: null == lastname
            ? _value.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        division: freezed == division
            ? _value.division
            : division // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        circle: freezed == circle
            ? _value.circle
            : circle // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactNo: freezed == contactNo
            ? _value.contactNo
            : contactNo // ignore: cast_nullable_to_non_nullable
                  as int?,
        dob: freezed == dob
            ? _value.dob
            : dob // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        caste: freezed == caste
            ? _value.caste
            : caste // ignore: cast_nullable_to_non_nullable
                  as String?,
        qualification: freezed == qualification
            ? _value.qualification
            : qualification // ignore: cast_nullable_to_non_nullable
                  as String?,
        bloodGroup: freezed == bloodGroup
            ? _value.bloodGroup
            : bloodGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        about: freezed == about
            ? _value.about
            : about // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileUserImpl implements _ProfileUser {
  const _$ProfileUserImpl({
    @JsonKey(name: 'student_id') required this.studentId,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.location,
    required this.division,
    required this.region,
    required this.circle,
    required this.address,
    @JsonKey(name: 'CONTACTNO') required this.contactNo,
    @JsonKey(name: 'DOB') required this.dob,
    @JsonKey(name: 'GENDER') required this.gender,
    @JsonKey(name: 'CASTE') required this.caste,
    @JsonKey(name: 'QUALIFICATION') required this.qualification,
    @JsonKey(name: 'blood_group') required this.bloodGroup,
    required this.about,
  });

  factory _$ProfileUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileUserImplFromJson(json);

  @override
  @JsonKey(name: 'student_id')
  final int studentId;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String username;
  @override
  final String? email;
  @override
  final String? location;
  @override
  final String? division;
  @override
  final String? region;
  @override
  final String? circle;
  @override
  final String? address;
  @override
  @JsonKey(name: 'CONTACTNO')
  final int? contactNo;
  @override
  @JsonKey(name: 'DOB')
  final String? dob;
  @override
  @JsonKey(name: 'GENDER')
  final String? gender;
  @override
  @JsonKey(name: 'CASTE')
  final String? caste;
  @override
  @JsonKey(name: 'QUALIFICATION')
  final String? qualification;
  @override
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @override
  final String? about;

  @override
  String toString() {
    return 'ProfileUser(studentId: $studentId, firstname: $firstname, lastname: $lastname, username: $username, email: $email, location: $location, division: $division, region: $region, circle: $circle, address: $address, contactNo: $contactNo, dob: $dob, gender: $gender, caste: $caste, qualification: $qualification, bloodGroup: $bloodGroup, about: $about)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUserImpl &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.division, division) ||
                other.division == division) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.circle, circle) || other.circle == circle) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contactNo, contactNo) ||
                other.contactNo == contactNo) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.caste, caste) || other.caste == caste) &&
            (identical(other.qualification, qualification) ||
                other.qualification == qualification) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.about, about) || other.about == about));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    studentId,
    firstname,
    lastname,
    username,
    email,
    location,
    division,
    region,
    circle,
    address,
    contactNo,
    dob,
    gender,
    caste,
    qualification,
    bloodGroup,
    about,
  );

  /// Create a copy of ProfileUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUserImplCopyWith<_$ProfileUserImpl> get copyWith =>
      __$$ProfileUserImplCopyWithImpl<_$ProfileUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileUserImplToJson(this);
  }
}

abstract class _ProfileUser implements ProfileUser {
  const factory _ProfileUser({
    @JsonKey(name: 'student_id') required final int studentId,
    required final String firstname,
    required final String lastname,
    required final String username,
    required final String? email,
    required final String? location,
    required final String? division,
    required final String? region,
    required final String? circle,
    required final String? address,
    @JsonKey(name: 'CONTACTNO') required final int? contactNo,
    @JsonKey(name: 'DOB') required final String? dob,
    @JsonKey(name: 'GENDER') required final String? gender,
    @JsonKey(name: 'CASTE') required final String? caste,
    @JsonKey(name: 'QUALIFICATION') required final String? qualification,
    @JsonKey(name: 'blood_group') required final String? bloodGroup,
    required final String? about,
  }) = _$ProfileUserImpl;

  factory _ProfileUser.fromJson(Map<String, dynamic> json) =
      _$ProfileUserImpl.fromJson;

  @override
  @JsonKey(name: 'student_id')
  int get studentId;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get username;
  @override
  String? get email;
  @override
  String? get location;
  @override
  String? get division;
  @override
  String? get region;
  @override
  String? get circle;
  @override
  String? get address;
  @override
  @JsonKey(name: 'CONTACTNO')
  int? get contactNo;
  @override
  @JsonKey(name: 'DOB')
  String? get dob;
  @override
  @JsonKey(name: 'GENDER')
  String? get gender;
  @override
  @JsonKey(name: 'CASTE')
  String? get caste;
  @override
  @JsonKey(name: 'QUALIFICATION')
  String? get qualification;
  @override
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @override
  String? get about;

  /// Create a copy of ProfileUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUserImplCopyWith<_$ProfileUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
