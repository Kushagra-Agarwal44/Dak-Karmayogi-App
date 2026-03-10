import 'package:dak_karmayogi_app/features/courses/data/models/course_model.dart';

import '../../domain/entities/course.dart';
import '../../domain/repositories/courses_repository.dart';
import '../datasources/courses_remote_datasource.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesRemoteDatasource remoteDatasource;

  CoursesRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Course>> getCourses({
    required int studentId,
    required bool isOnline,
  }) async {

    // 1. Ask the network layer for the Models
    final models = await remoteDatasource.getCourses(
      studentId: studentId,
      isOnline: isOnline,
    );

// 2. Convert Models into pure Domain Entities
    return models.map((e) => e.toEntity()).toList();
  }
}