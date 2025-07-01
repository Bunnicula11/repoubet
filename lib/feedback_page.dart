import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final questionController = TextEditingController();
    final suggestionController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your feedback matters!\nHelp us improve by sharing your thoughts.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: questionController,
              decoration: const InputDecoration(
                labelText: "Question",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: suggestionController,
              decoration: const InputDecoration(
                labelText: "Suggestions",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Send feedback logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
