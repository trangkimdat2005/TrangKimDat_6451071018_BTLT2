import 'package:flutter/material.dart';
import '../models/category_model.dart';

class ExpansionMenuView extends StatefulWidget {
  const ExpansionMenuView({super.key});

  @override
  State<ExpansionMenuView> createState() => _ExpansionMenuViewState();
}

class _ExpansionMenuViewState extends State<ExpansionMenuView> {
  // Khởi tạo dữ liệu mẫu (Mock data)
  final List<CategoryModel> _categories = [
    CategoryModel(
      title: "Fruits",
      items: [
        CategoryItem(name: "Apple", icon: "🍎"),
        CategoryItem(name: "Banana", icon: "🍌"),
        CategoryItem(name: "Orange", icon: "🍊"),
      ],
    ),
    CategoryModel(
      title: "Vegetables",
      items: [
        CategoryItem(name: "Broccoli", icon: "🥦"),
        CategoryItem(name: "Carrot", icon: "🥕"),
        CategoryItem(name: "Tomato", icon: "🍅"),
      ],
    ),
    CategoryModel(
      title: "Drinks",
      items: [
        CategoryItem(name: "Coffee", icon: "☕"),
        CategoryItem(name: "Milk", icon: "🥛"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6), // Màu nền xám nhạt
      appBar: AppBar(
        title: const Text(
          'Category Menu\nMSSV: 6451071018',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tiêu đề trang
              const Text(
                'Expansion Menu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Using ExpansionPanelList',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Danh sách ExpansionPanelList
              ExpansionPanelList(
                elevation: 1, // Độ đổ bóng
                expandedHeaderPadding: EdgeInsets.zero, // Xóa khoảng cách thừa khi mở
                // Hàm này bắt sự kiện khi người dùng bấm vào panel
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    // Đảo ngược trạng thái hiện tại (Đóng -> Mở, Mở -> Đóng)
                    _categories[index].isExpanded = !_categories[index].isExpanded;
                  });
                },
                // Tạo các Panel từ danh sách _categories
                children: _categories.map<ExpansionPanel>((CategoryModel category) {
                  return ExpansionPanel(
                    canTapOnHeader: true, // Cho phép bấm vào cả thanh tiêu đề để mở
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          category.title,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                    // Phần nội dung bên trong khi mở ra
                    body: Column(
                      children: category.items.map((item) {
                        return ListTile(
                          leading: Text(item.icon, style: const TextStyle(fontSize: 24)),
                          title: Text(item.name),
                        );
                      }).toList(),
                    ),
                    isExpanded: category.isExpanded, // Cập nhật trạng thái hiển thị
                  );
                }).toList(),
              ),

              const SizedBox(height: 40),

              // Nút "StatefulWidget Management" bo tròn ở cuối màn hình
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                      )
                    ]
                  ),
                  child: const Text(
                    'StatefulWidget Management',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}