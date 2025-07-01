import 'package:flutter/material.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Updates"),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "No updates available yet.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
