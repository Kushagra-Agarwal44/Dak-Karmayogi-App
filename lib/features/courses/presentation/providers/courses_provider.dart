import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/features/auth/data/models/auth_state.dart';
import 'package:dak_karmayogi_app/features/auth/presentation/providers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/courses_remote_datasource.dart';
import '../../data/repositories/courses_repository_impl.dart';
import '../../domain/entities/course.dart';
import '../../domain/repositories/courses_repository.dart';

part 'courses_provider.freezed.dart';

/// DATASOURCE
final coursesRemoteDatasourceProvider = Provider<CoursesRemoteDatasource>((
  ref,
) {
  final dio = ref.read(dioProvider);
  return CoursesRemoteDatasource(dio);
});

/// REPOSITORY
final coursesRepositoryProvider = Provider<CoursesRepository>((ref) {
  final datasource = ref.read(coursesRemoteDatasourceProvider);
  return CoursesRepositoryImpl(datasource);
});



/// CONTROLLER
final coursesControllerProvider =
    StateNotifierProvider.family<CoursesController, CoursesState, String>((
      ref,
      type,
    ) {
      final repository = ref.watch(coursesRepositoryProvider);
      final authState = ref.watch(authControllerProvider);

      final studentId = authState.userId;

      if (studentId == null) {
        throw Exception("User not authenticated");
      }

      return CoursesController(
        repository: repository,
        studentId: studentId,
        type: type,
      );
    });

class CoursesController extends StateNotifier<CoursesState> {
  final CoursesRepository repository;
  final int studentId;
  final String type;

  CoursesController({
    required this.repository,
    required this.studentId,
    required this.type,
  }) : super(const CoursesState.loading()) {
    fetchCourses();
  }

  Future<void> fetchCourses() async {


    try {
      /*While this works, relying on private generated classes (_Data) isn't the idiomatic way to use Freezed.

        Better approach: Use Freezed's built-in map functions:*/

      //   final currentState = state;

      // if (currentState is! _Data) {
      //   state = const CoursesState.loading();
      // }

      // Only set to loading if we aren't already displaying data

      state.maybeMap(
        data: (_) => null, // Do nothing, keep showing old data during refresh
        orElse: () => state = const CoursesState.loading(),
      );

      final isOnline = type == "online";

      final courses = await repository.getCourses(
        studentId: studentId,
        isOnline: isOnline,
      );

      state = CoursesState.data(courses);
    } catch (e) {
      state = CoursesState.error(e.toString());
    }
  }
}

/// STATE
@freezed
class CoursesState with _$CoursesState {
  const factory CoursesState.loading() = _Loading;

  const factory CoursesState.data(List<Course> courses) = _Data;

  const factory CoursesState.error(String message) = _Error;
}
