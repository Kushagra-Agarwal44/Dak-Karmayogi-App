import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/course.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    @JsonKey(name: "subject_id") required int courseId,
    @JsonKey(name: "student_id") required int studentId,
    @JsonKey(name: "subject_title") required String title,
    required String description,
    @JsonKey(name: "course_thumbnail") required String thumbnail,
    @JsonKey(name: "trg_type") required String type,
    required ProgressModel progress,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json)
      => _$CourseModelFromJson(json);
}

@freezed
class ProgressModel with _$ProgressModel {
  const factory ProgressModel({
    required double percentage,
  }) = _ProgressModel;

  factory ProgressModel.fromJson(Map<String, dynamic> json)
      => _$ProgressModelFromJson(json);
}

extension CourseModelMapper on CourseModel {
  Course toEntity() {
    return Course(
      courseId: courseId,
      studentId: studentId,
      title: title,
      description: description,
      thumbnail: thumbnail,
      type: type,
      progress: progress.percentage,
    );
  }
}