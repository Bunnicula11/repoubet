import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestFirestoreScreen extends StatefulWidget {
  const TestFirestoreScreen({super.key});

  @override
  State<TestFirestoreScreen> createState() => _TestFirestoreScreenState();
}

class _TestFirestoreScreenState extends State<TestFirestoreScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _message = "Press the button to test Firestore";

  Future<void> _testConnection() async {
    try {
      // 1️⃣ Write a test document
      await _firestore.collection('test').doc('connection').set({
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'Firebase connected!'
      });

      // 2️⃣ Read the test document
      final doc = await _firestore.collection('test').doc('connection').get();

      setState(() {
        _message = doc.exists
            ? "Success: ${doc.data()?['status']}"
            : "Document not found";
      });
    } catch (e) {
      setState(() {
        _message = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Connection Test")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _testConnection,
                child: const Text("Test Firestore Connection"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
