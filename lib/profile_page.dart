import 'package:flutter/material.dart';
import 'messages_page.dart';
import 'feedback_page.dart';
import 'updates_page.dart';
import 'sensitivity_page.dart';
import 'product_info_page.dart';
import 'login_screen.dart'; // <-- import your login screen

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
                    Text("1 camera device",
                        style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Profile Menu
            _buildTile(context, Icons.mail, "Messages", const MessagesPage()),
            _buildTile(context, Icons.info, "Product Info", const ProductInfoPage()),
            _buildTile(context, Icons.feedback, "Feedback", const FeedbackPage()),
            _buildTile(context, Icons.update, "Updates", const UpdatesPage()),
            _buildTile(context, Icons.sensors, "Sensitivity Settings", const SensitivityPage()),

            const Spacer(), // pushes logout button to bottom

            // Logout button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Confirmation dialog before logging out
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(), // close dialog
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(ctx).pop(); // close dialog
              // Redirect user to LoginScreen and clear history
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: Colors.grey[200],
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );
  }
}
