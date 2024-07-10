import 'package:flutter/material.dart';

class ManagerDashboard extends StatelessWidget {
  const ManagerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manager Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _dashboardButton(context, Icons.person, 'Profil', _navigateToProfile),
            _dashboardButton(context, Icons.bar_chart, 'Statistik', _navigateToStatistics),
            _dashboardButton(context, Icons.group, 'Kelola Pengguna', _navigateToManageUsers),
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

  void _navigateToStatistics(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const StatisticsPage()));
  }

  void _navigateToManageUsers(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ManageUsersPage()));
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

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistik'),
      ),
      body: Center(
        child: const Text('Halaman Statistik'),
      ),
    );
  }
}

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Pengguna'),
      ),
      body: Center(
        child: const Text('Halaman Kelola Pengguna'),
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
    home: const ManagerDashboard(),
  ));
}
