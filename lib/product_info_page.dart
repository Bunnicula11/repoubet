import 'package:flutter/material.dart';

class ProductInfoPage extends StatelessWidget {
  const ProductInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Info"),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("EchoGuard Smart Security", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Version: 1.0.0"),
            SizedBox(height: 10),
            Text("EchoGuard is a sound-detection security system with CCTV directional controls and real-time mobile alerts."),
            SizedBox(height: 20),
            Text("Developed by: EchoGuard Team"),
            Text("For support: support@echoguard.com"),
          ],
        ),
      ),
    );
  }
}
