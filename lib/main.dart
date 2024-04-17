import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';

import 'screens/home_screen.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // key : widget의 id 역할
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
