import 'package:flutter/material.dart';
import 'manager_login_page.dart';
import 'technician_login_page.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.grey[300],
              child: const Center(
                child: Text('Icon', style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('FSM DTwin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),),
            const SizedBox(height: 8,),
            const Text('Field Management Apps',
            style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TechnicianLoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
               backgroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
              child: const Text('Login as Field Technician', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManagerLoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
                ),
              ),
              child: const Text('Login as Field Manager', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}