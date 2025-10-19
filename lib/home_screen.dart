import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'notifications_page.dart';
import 'full_sensitivity_page.dart';
import 'no_sensitivity_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  bool fullSensitivityActive = false;
  bool noSensitivityActive = false;

  final List<Widget> _pages = [
    HomeContent(),
    NotificationsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      
    );
  }
}

//home
class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool fullSensitivityActive = false;
  bool noSensitivityActive = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1F1C2C), Color(0xFF928DAB)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                Image.asset('assets/logo.png', height: 50),
                const SizedBox(width: 10),
                const Text(
                  'EchoGuard',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Move the CCTV",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          // Directional Controls
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_upward, size: 50, color: Colors.blue),
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 50, color: Colors.blue),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 50),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 50, color: Colors.blue),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.arrow_downward, size: 50, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Full Sensitivity with checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: fullSensitivityActive,
                onChanged: (value) {
                  setState(() {
                    fullSensitivityActive = value ?? false;
                  });
                },
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.blue,
                  ),
                  icon: const Icon(Icons.tune),
                  label: const Text("Full Sensitivity"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FullSensitivityPage()),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // No Sensitivity with checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: noSensitivityActive,
                onChanged: (value) {
                  setState(() {
                    noSensitivityActive = value ?? false;
                  });
                },
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.redAccent,
                  ),
                  icon: const Icon(Icons.block),
                  label: const Text("No Sensitivity"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoSensitivityPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
