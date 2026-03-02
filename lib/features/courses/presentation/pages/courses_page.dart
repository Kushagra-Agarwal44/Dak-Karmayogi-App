import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Online"),
              Tab(text: "Onsite"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Online Courses List")),
            Center(child: Text("Onsite Courses List")),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text("Enroll New Course"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}