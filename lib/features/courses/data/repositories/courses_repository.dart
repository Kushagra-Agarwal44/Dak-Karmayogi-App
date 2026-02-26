import 'package:dak_karmayogi_app/features/courses/data/models/subject_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../models/enrolled_courses_response.dart';

class CoursesRepository {
  final Dio _dio;

  CoursesRepository(this._dio);

 Future<List<Course>> getEnrolledCourses(int studentId) async {
  try {
    final response = await _dio.get(
      '/courses/enrolled',
      queryParameters: {
        "student_id": studentId,
      },
    );

    print("ENROLLED COURSES RESPONSE:");
    print(response.data);

    final parsed =
        EnrolledCoursesResponse.fromJson(response.data);

    return parsed.data;
  } on DioException catch (e) {
    print("COURSE ERROR:");
    print(e.response?.data);

    throw Exception(
        e.response?.data['message'] ?? "Failed to fetch courses");
  }
}


Future<List<Subject>> getSubjects(int subjectId) async {
  try {
    final response = await _dio.get(
      '/courses/subject',
      queryParameters: {
        "subject_id": subjectId,
      },
    );

    final parsed =
        SubjectResponse.fromJson(response.data);

    return parsed.data;
  } on DioException catch (e) {
    throw Exception(
        e.response?.data['message'] ?? "Failed to fetch subjects");
  }
}



}
