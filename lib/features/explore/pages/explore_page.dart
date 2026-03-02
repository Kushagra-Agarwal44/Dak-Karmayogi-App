import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explore")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.play_circle_outline),
            title: Text("DakTube"),
            subtitle: Text("Video Learning Library"),
          ),
          ListTile(
            leading: Icon(Icons.menu_book_outlined),
            title: Text("Digital Library"),
            subtitle: Text("Books & Reading Material"),
          ),
        ],
      ),
    );
  }
}