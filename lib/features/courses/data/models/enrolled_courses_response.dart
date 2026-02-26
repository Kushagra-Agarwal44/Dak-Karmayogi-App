import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrolled_courses_response.freezed.dart';
part 'enrolled_courses_response.g.dart';

@freezed
class EnrolledCoursesResponse with _$EnrolledCoursesResponse {
  const factory EnrolledCoursesResponse({
    required bool success,
    required String message,
    required List<Course> data,
    required int status,
  }) = _EnrolledCoursesResponse;

  factory EnrolledCoursesResponse.fromJson(Map<String, dynamic> json) =>
      _$EnrolledCoursesResponseFromJson(json);
}

@freezed
class Course with _$Course {
  const factory Course({
    required int id,
    required String course_name,
    required String start_date,
    required String end_date,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json);
}
