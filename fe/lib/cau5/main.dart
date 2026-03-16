import 'package:flutter/material.dart';
import 'views/expansion_menu_view.dart'; // Import màn hình Expansion Menu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expansion App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ExpansionMenuView(), // Chạy màn hình Bài 5
    );
  }
}