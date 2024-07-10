import 'package:flutter/material.dart';

class TechnicianDashboard extends StatelessWidget {
  const TechnicianDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technician Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _dashboardButton(context, Icons.person, 'Profil', _navigateToProfile),
            _dashboardButton(context, Icons.assignment, 'Tugas', _navigateToTasks),
            _dashboardButton(context, Icons.report, 'Laporan', _navigateToReports),
            _dashboardButton(context, Icons.settings, 'Pengaturan', _navigateToSettings),
          ],
        ),
      ),
    );
  }

  Widget _dashboardButton(BuildContext context, IconData icon, String label, Function(BuildContext) onTap) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onTap(context),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 50, color: Colors.blue),
              const SizedBox(height: 20),
              Text(label, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }

  void _navigateToTasks(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const TasksPage()));
  }

  void _navigateToReports(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsPage()));
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: const Text('Halaman Profil'),
      ),
    );
  }
}

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas'),
      ),
      body: Center(
        child: const Text('Halaman Tugas'),
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan'),
      ),
      body: Center(
        child: const Text('Halaman Laporan'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: Center(
        child: const Text('Halaman Pengaturan'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const TechnicianDashboard(),
  ));
}
