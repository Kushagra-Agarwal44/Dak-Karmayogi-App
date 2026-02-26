import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_response.freezed.dart';
part 'subject_response.g.dart';

@freezed
class SubjectResponse with _$SubjectResponse {
  const factory SubjectResponse({
    required bool success,
    required String message,
    required List<Subject> data,
    required int status,
  }) = _SubjectResponse;

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    required int id,
    required String title,
    required String description,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}
