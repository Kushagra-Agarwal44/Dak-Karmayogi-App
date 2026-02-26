// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrolled_courses_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EnrolledCoursesResponse _$EnrolledCoursesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _EnrolledCoursesResponse.fromJson(json);
}

/// @nodoc
mixin _$EnrolledCoursesResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Course> get data => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  /// Serializes this EnrolledCoursesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnrolledCoursesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnrolledCoursesResponseCopyWith<EnrolledCoursesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrolledCoursesResponseCopyWith<$Res> {
  factory $EnrolledCoursesResponseCopyWith(
    EnrolledCoursesResponse value,
    $Res Function(EnrolledCoursesResponse) then,
  ) = _$EnrolledCoursesResponseCopyWithImpl<$Res, EnrolledCoursesResponse>;
  @useResult
  $Res call({bool success, String message, List<Course> data, int status});
}

/// @nodoc
class _$EnrolledCoursesResponseCopyWithImpl<
  $Res,
  $Val extends EnrolledCoursesResponse
>
    implements $EnrolledCoursesResponseCopyWith<$Res> {
  _$EnrolledCoursesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnrolledCoursesResponse
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
                      as List<Course>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EnrolledCoursesResponseImplCopyWith<$Res>
    implements $EnrolledCoursesResponseCopyWith<$Res> {
  factory _$$EnrolledCoursesResponseImplCopyWith(
    _$EnrolledCoursesResponseImpl value,
    $Res Function(_$EnrolledCoursesResponseImpl) then,
  ) = __$$EnrolledCoursesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Course> data, int status});
}

/// @nodoc
class __$$EnrolledCoursesResponseImplCopyWithImpl<$Res>
    extends
        _$EnrolledCoursesResponseCopyWithImpl<
          $Res,
          _$EnrolledCoursesResponseImpl
        >
    implements _$$EnrolledCoursesResponseImplCopyWith<$Res> {
  __$$EnrolledCoursesResponseImplCopyWithImpl(
    _$EnrolledCoursesResponseImpl _value,
    $Res Function(_$EnrolledCoursesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EnrolledCoursesResponse
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
      _$EnrolledCoursesResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<Course>,
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
class _$EnrolledCoursesResponseImpl implements _EnrolledCoursesResponse {
  const _$EnrolledCoursesResponseImpl({
    required this.success,
    required this.message,
    required final List<Course> data,
    required this.status,
  }) : _data = data;

  factory _$EnrolledCoursesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrolledCoursesResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Course> _data;
  @override
  List<Course> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int status;

  @override
  String toString() {
    return 'EnrolledCoursesResponse(success: $success, message: $message, data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrolledCoursesResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    const DeepCollectionEquality().hash(_data),
    status,
  );

  /// Create a copy of EnrolledCoursesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrolledCoursesResponseImplCopyWith<_$EnrolledCoursesResponseImpl>
  get copyWith =>
      __$$EnrolledCoursesResponseImplCopyWithImpl<
        _$EnrolledCoursesResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrolledCoursesResponseImplToJson(this);
  }
}

abstract class _EnrolledCoursesResponse implements EnrolledCoursesResponse {
  const factory _EnrolledCoursesResponse({
    required final bool success,
    required final String message,
    required final List<Course> data,
    required final int status,
  }) = _$EnrolledCoursesResponseImpl;

  factory _EnrolledCoursesResponse.fromJson(Map<String, dynamic> json) =
      _$EnrolledCoursesResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Course> get data;
  @override
  int get status;

  /// Create a copy of EnrolledCoursesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnrolledCoursesResponseImplCopyWith<_$EnrolledCoursesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  int get id => throw _privateConstructorUsedError;
  String get course_name => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call({int id, String course_name, String start_date, String end_date});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? course_name = null,
    Object? start_date = null,
    Object? end_date = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            course_name: null == course_name
                ? _value.course_name
                : course_name // ignore: cast_nullable_to_non_nullable
                      as String,
            start_date: null == start_date
                ? _value.start_date
                : start_date // ignore: cast_nullable_to_non_nullable
                      as String,
            end_date: null == end_date
                ? _value.end_date
                : end_date // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
    _$CourseImpl value,
    $Res Function(_$CourseImpl) then,
  ) = __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String course_name, String start_date, String end_date});
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
    _$CourseImpl _value,
    $Res Function(_$CourseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? course_name = null,
    Object? start_date = null,
    Object? end_date = null,
  }) {
    return _then(
      _$CourseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        course_name: null == course_name
            ? _value.course_name
            : course_name // ignore: cast_nullable_to_non_nullable
                  as String,
        start_date: null == start_date
            ? _value.start_date
            : start_date // ignore: cast_nullable_to_non_nullable
                  as String,
        end_date: null == end_date
            ? _value.end_date
            : end_date // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseImpl implements _Course {
  const _$CourseImpl({
    required this.id,
    required this.course_name,
    required this.start_date,
    required this.end_date,
  });

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  final int id;
  @override
  final String course_name;
  @override
  final String start_date;
  @override
  final String end_date;

  @override
  String toString() {
    return 'Course(id: $id, course_name: $course_name, start_date: $start_date, end_date: $end_date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.course_name, course_name) ||
                other.course_name == course_name) &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, course_name, start_date, end_date);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(this);
  }
}

abstract class _Course implements Course {
  const factory _Course({
    required final int id,
    required final String course_name,
    required final String start_date,
    required final String end_date,
  }) = _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  int get id;
  @override
  String get course_name;
  @override
  String get start_date;
  @override
  String get end_date;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
