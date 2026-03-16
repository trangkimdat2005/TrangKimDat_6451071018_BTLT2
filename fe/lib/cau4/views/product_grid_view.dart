import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({super.key});

  // Khởi tạo 6 sản phẩm mẫu bám sát theo hình ảnh đề bài
  final List<ProductModel> products = [
    ProductModel(
      name: "Giày Chạy Bộ Nam",
      price: "đ950,000",
      imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=400&auto=format&fit=crop",
      rating: 4.5,
      isPriceGreen: true,
    ),
    ProductModel(
      name: "Áo Thun Tập Luyện",
      price: "đ320,000",
      imageUrl: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?q=80&w=400&auto=format&fit=crop",
      rating: 4.5,
      isPriceGreen: false, // Giá màu cam
    ),
    ProductModel(
      name: "Bóng Đá Thể Thao",
      price: "đ510,000",
      imageUrl: "https://images.unsplash.com/photo-1614632537190-23e4146777db?q=80&w=400&auto=format&fit=crop",
      rating: 4.5,
      isPriceGreen: true,
    ),
    ProductModel(
      name: "Túi Thể Thao",
      price: "đ415,000",
      imageUrl: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=400&auto=format&fit=crop",
      rating: 4.5,
      isPriceGreen: true,
    ),
    ProductModel(
      name: "Mũ Lưỡi Trai",
      price: "đ185,000",
      imageUrl: "https://images.unsplash.com/photo-1588850561407-ed78c282e89b?q=80&w=400&auto=format&fit=crop",
      rating: 4.5,
      isPriceGreen: false,
    ),
    ProductModel(
      name: "Vớ Thể Thao Cao Cấp",
      price: "đ95,000",
      imageUrl: "https://images.unsplash.com/photo-1586350977771-b3b0abd50c82?q=80&w=400&auto=format&fit=crop",
      rating: 4.5,
      isPriceGreen: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Nền xám
      appBar: AppBar(
        backgroundColor: Colors.blue, // AppBar màu xanh dương
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Cửa Hàng Thể Thao\nMSSV: 6451071018',
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        // Sử dụng GridView.count theo yêu cầu
        child: GridView.count(
          crossAxisCount: 2, // 2 cột
          crossAxisSpacing: 10, // Khoảng cách giữa các cột
          mainAxisSpacing: 10, // Khoảng cách giữa các hàng
          childAspectRatio: 0.75, // Tỉ lệ chiều rộng / chiều cao của mỗi item
          children: products.map((product) {
            return Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              // Sử dụng GridTile bọc Column
              child: GridTile(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phần ảnh sản phẩm
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE0E0E0), // Màu xám lót dưới ảnh
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => 
                                const Icon(Icons.image, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    // Phần nội dung Text (Tên, Giá, Đánh giá)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.price,
                                style: TextStyle(
                                  color: product.isPriceGreen ? Colors.green : Colors.orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 12),
                                  const SizedBox(width: 2),
                                  Text(
                                    '${product.rating}/5',
                                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(), // Chuyển danh sách sản phẩm thành danh sách Widget
        ),
      ),
    );
  }
}