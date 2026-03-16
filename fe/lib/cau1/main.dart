import 'package:flutter/material.dart';
import 'views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false, // Tắt chữ "DEBUG" ở góc màn hình
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ProfileView(), // Gọi màn hình Profile
    );
  }
}