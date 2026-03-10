// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return _CourseModel.fromJson(json);
}

/// @nodoc
mixin _$CourseModel {
  @JsonKey(name: "subject_id")
  int get courseId => throw _privateConstructorUsedError;
  @JsonKey(name: "student_id")
  int get studentId => throw _privateConstructorUsedError;
  @JsonKey(name: "subject_title")
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "course_thumbnail")
  String get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: "trg_type")
  String get type => throw _privateConstructorUsedError;
  ProgressModel get progress => throw _privateConstructorUsedError;

  /// Serializes this CourseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseModelCopyWith<CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelCopyWith<$Res> {
  factory $CourseModelCopyWith(
    CourseModel value,
    $Res Function(CourseModel) then,
  ) = _$CourseModelCopyWithImpl<$Res, CourseModel>;
  @useResult
  $Res call({
    @JsonKey(name: "subject_id") int courseId,
    @JsonKey(name: "student_id") int studentId,
    @JsonKey(name: "subject_title") String title,
    String description,
    @JsonKey(name: "course_thumbnail") String thumbnail,
    @JsonKey(name: "trg_type") String type,
    ProgressModel progress,
  });

  $ProgressModelCopyWith<$Res> get progress;
}

/// @nodoc
class _$CourseModelCopyWithImpl<$Res, $Val extends CourseModel>
    implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? studentId = null,
    Object? title = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? type = null,
    Object? progress = null,
  }) {
    return _then(
      _value.copyWith(
            courseId: null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                      as int,
            studentId: null == studentId
                ? _value.studentId
                : studentId // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnail: null == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as ProgressModel,
          )
          as $Val,
    );
  }

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgressModelCopyWith<$Res> get progress {
    return $ProgressModelCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseModelImplCopyWith<$Res>
    implements $CourseModelCopyWith<$Res> {
  factory _$$CourseModelImplCopyWith(
    _$CourseModelImpl value,
    $Res Function(_$CourseModelImpl) then,
  ) = __$$CourseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: "subject_id") int courseId,
    @JsonKey(name: "student_id") int studentId,
    @JsonKey(name: "subject_title") String title,
    String description,
    @JsonKey(name: "course_thumbnail") String thumbnail,
    @JsonKey(name: "trg_type") String type,
    ProgressModel progress,
  });

  @override
  $ProgressModelCopyWith<$Res> get progress;
}

/// @nodoc
class __$$CourseModelImplCopyWithImpl<$Res>
    extends _$CourseModelCopyWithImpl<$Res, _$CourseModelImpl>
    implements _$$CourseModelImplCopyWith<$Res> {
  __$$CourseModelImplCopyWithImpl(
    _$CourseModelImpl _value,
    $Res Function(_$CourseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? studentId = null,
    Object? title = null,
    Object? description = null,
    Object? thumbnail = null,
    Object? type = null,
    Object? progress = null,
  }) {
    return _then(
      _$CourseModelImpl(
        courseId: null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                  as int,
        studentId: null == studentId
            ? _value.studentId
            : studentId // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: null == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as ProgressModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseModelImpl implements _CourseModel {
  const _$CourseModelImpl({
    @JsonKey(name: "subject_id") required this.courseId,
    @JsonKey(name: "student_id") required this.studentId,
    @JsonKey(name: "subject_title") required this.title,
    required this.description,
    @JsonKey(name: "course_thumbnail") required this.thumbnail,
    @JsonKey(name: "trg_type") required this.type,
    required this.progress,
  });

  factory _$CourseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseModelImplFromJson(json);

  @override
  @JsonKey(name: "subject_id")
  final int courseId;
  @override
  @JsonKey(name: "student_id")
  final int studentId;
  @override
  @JsonKey(name: "subject_title")
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: "course_thumbnail")
  final String thumbnail;
  @override
  @JsonKey(name: "trg_type")
  final String type;
  @override
  final ProgressModel progress;

  @override
  String toString() {
    return 'CourseModel(courseId: $courseId, studentId: $studentId, title: $title, description: $description, thumbnail: $thumbnail, type: $type, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseModelImpl &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    courseId,
    studentId,
    title,
    description,
    thumbnail,
    type,
    progress,
  );

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseModelImplCopyWith<_$CourseModelImpl> get copyWith =>
      __$$CourseModelImplCopyWithImpl<_$CourseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseModelImplToJson(this);
  }
}

abstract class _CourseModel implements CourseModel {
  const factory _CourseModel({
    @JsonKey(name: "subject_id") required final int courseId,
    @JsonKey(name: "student_id") required final int studentId,
    @JsonKey(name: "subject_title") required final String title,
    required final String description,
    @JsonKey(name: "course_thumbnail") required final String thumbnail,
    @JsonKey(name: "trg_type") required final String type,
    required final ProgressModel progress,
  }) = _$CourseModelImpl;

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$CourseModelImpl.fromJson;

  @override
  @JsonKey(name: "subject_id")
  int get courseId;
  @override
  @JsonKey(name: "student_id")
  int get studentId;
  @override
  @JsonKey(name: "subject_title")
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: "course_thumbnail")
  String get thumbnail;
  @override
  @JsonKey(name: "trg_type")
  String get type;
  @override
  ProgressModel get progress;

  /// Create a copy of CourseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseModelImplCopyWith<_$CourseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProgressModel _$ProgressModelFromJson(Map<String, dynamic> json) {
  return _ProgressModel.fromJson(json);
}

/// @nodoc
mixin _$ProgressModel {
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this ProgressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProgressModelCopyWith<ProgressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressModelCopyWith<$Res> {
  factory $ProgressModelCopyWith(
    ProgressModel value,
    $Res Function(ProgressModel) then,
  ) = _$ProgressModelCopyWithImpl<$Res, ProgressModel>;
  @useResult
  $Res call({double percentage});
}

/// @nodoc
class _$ProgressModelCopyWithImpl<$Res, $Val extends ProgressModel>
    implements $ProgressModelCopyWith<$Res> {
  _$ProgressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? percentage = null}) {
    return _then(
      _value.copyWith(
            percentage: null == percentage
                ? _value.percentage
                : percentage // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProgressModelImplCopyWith<$Res>
    implements $ProgressModelCopyWith<$Res> {
  factory _$$ProgressModelImplCopyWith(
    _$ProgressModelImpl value,
    $Res Function(_$ProgressModelImpl) then,
  ) = __$$ProgressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double percentage});
}

/// @nodoc
class __$$ProgressModelImplCopyWithImpl<$Res>
    extends _$ProgressModelCopyWithImpl<$Res, _$ProgressModelImpl>
    implements _$$ProgressModelImplCopyWith<$Res> {
  __$$ProgressModelImplCopyWithImpl(
    _$ProgressModelImpl _value,
    $Res Function(_$ProgressModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? percentage = null}) {
    return _then(
      _$ProgressModelImpl(
        percentage: null == percentage
            ? _value.percentage
            : percentage // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressModelImpl implements _ProgressModel {
  const _$ProgressModelImpl({required this.percentage});

  factory _$ProgressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressModelImplFromJson(json);

  @override
  final double percentage;

  @override
  String toString() {
    return 'ProgressModel(percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressModelImpl &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, percentage);

  /// Create a copy of ProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressModelImplCopyWith<_$ProgressModelImpl> get copyWith =>
      __$$ProgressModelImplCopyWithImpl<_$ProgressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressModelImplToJson(this);
  }
}

abstract class _ProgressModel implements ProgressModel {
  const factory _ProgressModel({required final double percentage}) =
      _$ProgressModelImpl;

  factory _ProgressModel.fromJson(Map<String, dynamic> json) =
      _$ProgressModelImpl.fromJson;

  @override
  double get percentage;

  /// Create a copy of ProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProgressModelImplCopyWith<_$ProgressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
