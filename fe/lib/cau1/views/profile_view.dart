import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  // Tạo một dữ liệu mẫu (Mock data) từ UserModel
  final UserModel user = UserModel(
    name: "Nguyen Lan Huong",
    email: "lanhuong.nguyen@example.com",
    avatarUrl: "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg", // Link ảnh tạm
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF264653), // Màu xanh cổ vịt giống thiết kế
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Profile\nMSSV: 6451071018',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      // Căn giữa toàn bộ nội dung trong body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
          crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa theo chiều ngang
          children: [
            // Ảnh đại diện
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
            const SizedBox(height: 20), // Khoảng cách
            
            // Tên
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            // Email
            Text(
              user.email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            
            // Nút Edit Profile
            ElevatedButton(
              onPressed: () {
                // Xử lý sự kiện khi bấm nút
                print("Edit Profile tapped!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Màu nền của nút
                foregroundColor: Colors.white, // Màu chữ
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bo góc nút
                ),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}