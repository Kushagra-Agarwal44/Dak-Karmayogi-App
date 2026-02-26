// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubjectResponse _$SubjectResponseFromJson(Map<String, dynamic> json) {
  return _SubjectResponse.fromJson(json);
}

/// @nodoc
mixin _$SubjectResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Subject> get data => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  /// Serializes this SubjectResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectResponseCopyWith<SubjectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectResponseCopyWith<$Res> {
  factory $SubjectResponseCopyWith(
    SubjectResponse value,
    $Res Function(SubjectResponse) then,
  ) = _$SubjectResponseCopyWithImpl<$Res, SubjectResponse>;
  @useResult
  $Res call({bool success, String message, List<Subject> data, int status});
}

/// @nodoc
class _$SubjectResponseCopyWithImpl<$Res, $Val extends SubjectResponse>
    implements $SubjectResponseCopyWith<$Res> {
  _$SubjectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectResponse
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
                      as List<Subject>,
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
abstract class _$$SubjectResponseImplCopyWith<$Res>
    implements $SubjectResponseCopyWith<$Res> {
  factory _$$SubjectResponseImplCopyWith(
    _$SubjectResponseImpl value,
    $Res Function(_$SubjectResponseImpl) then,
  ) = __$$SubjectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Subject> data, int status});
}

/// @nodoc
class __$$SubjectResponseImplCopyWithImpl<$Res>
    extends _$SubjectResponseCopyWithImpl<$Res, _$SubjectResponseImpl>
    implements _$$SubjectResponseImplCopyWith<$Res> {
  __$$SubjectResponseImplCopyWithImpl(
    _$SubjectResponseImpl _value,
    $Res Function(_$SubjectResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubjectResponse
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
      _$SubjectResponseImpl(
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
                  as List<Subject>,
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
class _$SubjectResponseImpl implements _SubjectResponse {
  const _$SubjectResponseImpl({
    required this.success,
    required this.message,
    required final List<Subject> data,
    required this.status,
  }) : _data = data;

  factory _$SubjectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Subject> _data;
  @override
  List<Subject> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int status;

  @override
  String toString() {
    return 'SubjectResponse(success: $success, message: $message, data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectResponseImpl &&
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

  /// Create a copy of SubjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectResponseImplCopyWith<_$SubjectResponseImpl> get copyWith =>
      __$$SubjectResponseImplCopyWithImpl<_$SubjectResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectResponseImplToJson(this);
  }
}

abstract class _SubjectResponse implements SubjectResponse {
  const factory _SubjectResponse({
    required final bool success,
    required final String message,
    required final List<Subject> data,
    required final int status,
  }) = _$SubjectResponseImpl;

  factory _SubjectResponse.fromJson(Map<String, dynamic> json) =
      _$SubjectResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Subject> get data;
  @override
  int get status;

  /// Create a copy of SubjectResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectResponseImplCopyWith<_$SubjectResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call({int id, String title, String description});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
    _$SubjectImpl value,
    $Res Function(_$SubjectImpl) then,
  ) = __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String description});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
    _$SubjectImpl _value,
    $Res Function(_$SubjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(
      _$SubjectImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl({
    required this.id,
    required this.title,
    required this.description,
  });

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'Subject(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(this);
  }
}

abstract class _Subject implements Subject {
  const factory _Subject({
    required final int id,
    required final String title,
    required final String description,
  }) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;

  /// Create a copy of Subject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
