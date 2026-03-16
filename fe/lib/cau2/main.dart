import 'package:flutter/material.dart';
import 'views/food_list_view.dart'; // Import màn hình mới

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FoodListView(), // Thay đổi thành FoodListView
    );
  }
}