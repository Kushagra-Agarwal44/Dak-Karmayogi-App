import 'package:dak_karmayogi_app/core/providers/core_providers.dart';
import 'package:dak_karmayogi_app/features/courses/data/repositories/courses_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coursesRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  return CoursesRepository(dio);
});
