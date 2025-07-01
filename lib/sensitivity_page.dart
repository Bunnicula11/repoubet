import 'package:flutter/material.dart';

class SensitivityPage extends StatefulWidget {
  const SensitivityPage({super.key});

  @override
  State<SensitivityPage> createState() => _SensitivityPageState();
}

class _SensitivityPageState extends State<SensitivityPage> {
  double _sensitivity = 50;
  final List<String> _emergencyContacts = [
    "J&A A. Amo: 09514423290",
    "Admin: 09876543210"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sound Sensor Sensitivity"),
        backgroundColor: const Color(0xFF1F1C2C),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Adjust Sensor Sensitivity"),
            Slider(
              value: _sensitivity,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sensitivity.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sensitivity = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Emergency Numbers"),
            ..._emergencyContacts.map((contact) => ListTile(
                  title: Text(contact),
                )),
            ElevatedButton.icon(
              onPressed: () {
                // Logic to add number
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Number"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
