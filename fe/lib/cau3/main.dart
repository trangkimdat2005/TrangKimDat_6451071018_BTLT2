import 'package:flutter/material.dart';
import 'views/news_feed_view.dart'; // Import view tin tức

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: NewsFeedView(), // Chạy màn hình News
    );
  }
}