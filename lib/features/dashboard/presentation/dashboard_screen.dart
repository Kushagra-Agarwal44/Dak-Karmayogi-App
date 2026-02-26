import 'package:dak_karmayogi_app/features/courses/presentation/providers/courses_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/providers/auth_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: Column(
          children: [ElevatedButton(
            onPressed: () async {
              final user =
                  await ref.read(authControllerProvider.notifier).fetchProfile();
          
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Welcome ${user.firstname}")),
              );
            },
            child: const Text("Fetch Profile"),
          ),
          ElevatedButton(
  onPressed: () async {
    try {
      final courses = await ref
          .read(coursesRepositoryProvider)
          .getEnrolledCourses(564308); // temporary hardcoded

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Courses: ${courses.length}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  },
  child: const Text("Fetch Enrolled Courses"),
),

          
          ]
        ),
      ),
    );
  }
}
