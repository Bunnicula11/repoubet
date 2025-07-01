import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("User123"),
              subtitle: Text("Updates will be available at 6:00 UTC"),
              trailing: Text("Now"),
            ),
            SizedBox(height: 10),
            Text(
              "Check https://echoguardapp.page.link for more info",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
