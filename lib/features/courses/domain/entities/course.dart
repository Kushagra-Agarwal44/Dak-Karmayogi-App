class Course {
  final int courseId;
  final int studentId;
  final String title;
  final String description;
  final String thumbnail;
  final String type;
  final double progress;

  Course({
    required this.courseId,
    required this.studentId,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.type,
    required this.progress,
  });
}