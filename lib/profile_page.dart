import 'package:flutter/material.dart';
import 'messages_page.dart';
import 'feedback_page.dart';
import 'updates_page.dart';
import 'sensitivity_page.dart';
import 'product_info_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("user@gmail.com", style: TextStyle(fontSize: 16)),
                    Text("1 camera device", style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            _buildTile(context, Icons.mail, "Messages", const MessagesPage()),
            _buildTile(context, Icons.info, "Product Info", const ProductInfoPage()),
            _buildTile(context, Icons.feedback, "Feedback", const FeedbackPage()),
            _buildTile(context, Icons.update, "Updates", const UpdatesPage()),
            _buildTile(context, Icons.sensors, "Sensitivity Settings", const SensitivityPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Colors.grey[200],
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => page),
      ),
    );
  }
}
