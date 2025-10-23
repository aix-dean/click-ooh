import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/assignment_details_screen.dart';
import 'screens/congratulations_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click OOH',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(), // Start with login
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/assignment_details': (context) => AssignmentDetailsScreen(),
        '/congratulations': (context) => const CongratulationsScreen(),
      },
    );
  }
}
