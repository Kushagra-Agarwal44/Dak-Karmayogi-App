// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      courseId: (json['subject_id'] as num).toInt(),
      studentId: (json['student_id'] as num).toInt(),
      title: json['subject_title'] as String,
      description: json['description'] as String,
      thumbnail: json['course_thumbnail'] as String,
      type: json['trg_type'] as String,
      progress: ProgressModel.fromJson(
        json['progress'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      'subject_id': instance.courseId,
      'student_id': instance.studentId,
      'subject_title': instance.title,
      'description': instance.description,
      'course_thumbnail': instance.thumbnail,
      'trg_type': instance.type,
      'progress': instance.progress,
    };

_$ProgressModelImpl _$$ProgressModelImplFromJson(Map<String, dynamic> json) =>
    _$ProgressModelImpl(percentage: (json['percentage'] as num).toDouble());

Map<String, dynamic> _$$ProgressModelImplToJson(_$ProgressModelImpl instance) =>
    <String, dynamic>{'percentage': instance.percentage};
