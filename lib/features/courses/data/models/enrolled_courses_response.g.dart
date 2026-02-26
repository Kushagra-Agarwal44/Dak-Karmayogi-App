// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_courses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrolledCoursesResponseImpl _$$EnrolledCoursesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$EnrolledCoursesResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$$EnrolledCoursesResponseImplToJson(
  _$EnrolledCoursesResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'status': instance.status,
};

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
  id: (json['id'] as num).toInt(),
  course_name: json['course_name'] as String,
  start_date: json['start_date'] as String,
  end_date: json['end_date'] as String,
);

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_name': instance.course_name,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
    };
