import 'package:flutter/material.dart';

class NoSensitivityPage extends StatefulWidget {
  const NoSensitivityPage({super.key});

  @override
  State<NoSensitivityPage> createState() => _NoSensitivityPageState();
}

class _NoSensitivityPageState extends State<NoSensitivityPage> {
  TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);

  Future<void> _pickTime(bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStart ? startTime : endTime,
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("No Sensitivity Time")),
      body: Center(
  child: SingleChildScrollView(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // shrink to content so centering is obvious
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
          children: [
            Text(
              "From: ${startTime.format(context)}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pickTime(true),
              child: const Text("Pick Start Time"),
            ),
            const SizedBox(height: 20),
            Text(
              "To: ${endTime.format(context)}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _pickTime(false),
              child: const Text("Pick End Time"),
            ),
            const SizedBox(height: 30),
            // keep Save button nicely centered with a fixed width
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),

    );
  }
}
