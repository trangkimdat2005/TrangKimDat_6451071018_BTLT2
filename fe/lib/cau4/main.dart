import 'package:flutter/material.dart';
import 'views/product_grid_view.dart'; // Import màn hình Grid

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ProductGridView(), // Chạy màn hình Grid Sản Phẩm
    );
  }
}