// Model cho từng món đồ (ví dụ: Apple, Banana...)
class CategoryItem {
  final String name;
  final String icon; // Sử dụng emoji thay cho icon ảnh để giống thiết kế

  CategoryItem({required this.name, required this.icon});
}

// Model cho danh mục lớn (Fruits, Vegetables...)
class CategoryModel {
  final String title;
  final List<CategoryItem> items;
  bool isExpanded; // QUAN TRỌNG: Biến này để theo dõi trạng thái đóng/mở

  CategoryModel({
    required this.title,
    required this.items,
    this.isExpanded = false, // Mặc định là đóng
  });
}