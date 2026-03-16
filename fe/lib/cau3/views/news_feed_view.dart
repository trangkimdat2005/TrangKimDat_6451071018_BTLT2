import 'package:flutter/material.dart';
import '../models/news_model.dart';

class NewsFeedView extends StatelessWidget {
  NewsFeedView({super.key});

  // Dữ liệu mẫu sát với hình ảnh đề bài
  final List<NewsModel> newsList = [
    NewsModel(
      title: "Article Title 1: Flutter is awesome!",
      description: "Learn about cross-platform development with the latest news on Flutter framework updates and community tutorials.",
      imageUrl: "https://images.unsplash.com/photo-1496886007421-ea4cdd01e63a?q=80&w=600&auto=format&fit=crop", // Ảnh minh họa thành phố
    ),
    NewsModel(
      title: "Article Title 2: Local Coffee Shop Opens",
      description: "The cozy new cafe, \"The Daily Grind,\" offers local brews and a relaxing atmosphere for customers.",
      imageUrl: "https://images.unsplash.com/photo-1497935586351-b67a49e012bf?q=80&w=600&auto=format&fit=crop", // Ảnh minh họa quán cafe
    ),
    NewsModel(
      title: "Article Title 3: New Tech Gadgets",
      description: "Discover the newest smartphones, smartwatches, and innovative devices hitting the market this week.",
      imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=600&auto=format&fit=crop", // Ảnh minh họa phong cảnh/công nghệ
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Nền xám nhạt để nổi bật Card
      appBar: AppBar(
        title: const Text(
          'News\nMSSV: 6451071018',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue, // Màu AppBar xanh dương như thiết kế
        elevation: 0,
      ),
      // Sử dụng SingleChildScrollView kết hợp Column theo đúng yêu cầu
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: newsList.map((news) {
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phần hình ảnh bài viết
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)), // Bo góc phần trên của ảnh theo Card
                      child: Image.network(
                        news.imageUrl,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => 
                          Container(
                            height: 150, 
                            color: Colors.grey, 
                            child: Icon(Icons.image, size: 50, color: Colors.white),
                          ),
                      ),
                    ),
                    
                    // Phần Text (Tiêu đề và Mô tả)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            news.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            news.description,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}