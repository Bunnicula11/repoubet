import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background for contrast
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          NotificationTile(
            icon: Icons.warning,
            color: Colors.red,
            title: "Sound detected near Main Gate",
            time: "Just now",
          ),
          NotificationTile(
            icon: Icons.camera_alt,
            color: Colors.blue,
            title: "New camera connected",
            time: "5 minutes ago",
          ),
          NotificationTile(
            icon: Icons.sensors,
            color: Colors.orange,
            title: "Sensitivity level changed",
            time: "Today at 8:15 AM",
          ),
          NotificationTile(
            icon: Icons.update,
            color: Colors.green,
            title: "System updated to version 1.2",
            time: "Yesterday",
          ),
          NotificationTile(
            icon: Icons.lock,
            color: Colors.purple,
            title: "Password changed successfully",
            time: "2 days ago",
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String time;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title),
        subtitle: Text(time),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
