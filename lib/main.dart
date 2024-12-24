import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Di Sini',
      initialRoute: '/', // Default route
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 59, 166, 88),
      body: Center(
        child: Text(
          'BelajarDiSini',
          style: TextStyle(fontWeight:FontWeight.bold,fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }
}
