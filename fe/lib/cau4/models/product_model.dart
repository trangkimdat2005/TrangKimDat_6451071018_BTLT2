class ProductModel {
  final String name;
  final String price;
  final String imageUrl;
  final double rating;
  final bool isPriceGreen; // Thêm thuộc tính này để phân biệt màu giá (xanh/cam) giống thiết kế

  ProductModel({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.isPriceGreen = true,
  });
}