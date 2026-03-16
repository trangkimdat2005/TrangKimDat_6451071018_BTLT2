import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodListView extends StatelessWidget {
  FoodListView({super.key});

  // Tạo danh sách dữ liệu mẫu (Mock data) dựa trên hình ảnh
  final List<FoodModel> foods = [
    FoodModel(
      name: "Phở Bò",
      description: "Phở Bò Đặc Biệt",
      price: "65,000 VNĐ",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/5/53/Pho_Bo_in_Hanoi.jpg", // Link ảnh minh họa
    ),
    FoodModel(
      name: "Bún Chả",
      description: "Bún Chả Hà Nội",
      price: "55,000 VNĐ",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/b/bc/Bun_cha_Ha_Noi.jpg",
    ),
    FoodModel(
      name: "Cơm Tấm",
      description: "Cơm Tấm Sườn Bì Chả",
      price: "50,000 VNĐ",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/c/ca/Com_tam_suon_bi_cha.jpg",
    ),
    FoodModel(
      name: "Bánh Mì",
      description: "Bánh Mì Thịt Nướng",
      price: "35,000 VNĐ",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/1/1f/B%C3%A1nh_m%C3%AC_th%E1%BB%8Bt_n%C6%B0%E1%BB%9Bng.jpg",
    ),
    FoodModel(
      name: "Gỏi Cuốn",
      description: "Gỏi Cuốn Tôm Thịt",
      price: "40,000 VNĐ",
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/G%E1%BB%8Fi_cu%E1%BB%91n.jpg/1200px-G%E1%BB%8Fi_cu%E1%BB%91n.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Màu nền xám nhạt để làm nổi bật các Card
      appBar: AppBar(
        title: const Text(
          'DANH SÁCH MÓN ĂN\nMSSV: 6451071018',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFF1565C0), // Màu xanh dương đậm giống thiết kế
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Sử dụng ListView.builder để tối ưu hiệu suất cho danh sách dài
        child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            final food = foods[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bo tròn góc Card
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                // Sử dụng Row để xếp ảnh và nội dung nằm ngang
                child: Row(
                  children: [
                    // Hình ảnh món ăn
                    ClipOval(
                      child: Image.network(
                        food.imageUrl,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                        // Hiển thị icon mặc định nếu lỗi load ảnh
                        errorBuilder: (context, error, stackTrace) => 
                            const Icon(Icons.fastfood, size: 70, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 16), // Khoảng cách giữa ảnh và chữ
                    
                    // Nội dung Text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
                        children: [
                          Text(
                            food.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            food.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            food.price,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1976D2), // Màu chữ xanh dương
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}