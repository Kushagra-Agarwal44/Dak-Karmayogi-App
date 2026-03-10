import 'package:dio/dio.dart';
import '../models/course_model.dart';

class CoursesRemoteDatasource {
  final Dio dio;

  CoursesRemoteDatasource(this.dio);

  Future<List<CourseModel>> getCourses({
    required int studentId,
    required bool isOnline,
  }) async {
    try {
      // 1. Make the POST request
      final response = await dio.post(
        "/courses/enrolled",
        data: {"student_id": studentId, "is_online": isOnline},
      );

      // 2. Extract the data safely
      final data = response.data["data"];
      if (data == null || data["courses"] == null) return [];

      // 3. Convert raw JSON list to CourseModel list
      final courses = data["courses"] as List;
      return courses.map((e) => CourseModel.fromJson(e)).toList();
    } on DioException catch (e) {
      // 4. Handle specific HTTP errors

      if (e.response?.statusCode == 404) {
        return [];
      }
      rethrow;
    }
  }
}
