class ProductModel {
  final String brand;
  final String category;
  final String description;
  final double discountPercentage;
  final num id;
  final List<String> images;
  final bool isTrending;
  final bool isDealOfTheDay;
  final num priceD;
  final num rating;
  final num stock;
  final String thumbnail;
  final String title;

  ProductModel({
    required this.brand,
    required this.category,
    required this.description,
    required this.discountPercentage,
    required this.id,
    required this.images,
    required this.isTrending,
    required this.isDealOfTheDay,
    required this.priceD,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.title,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      discountPercentage: (json['discountPercentage'] ?? 0.0).toDouble(),
      id: json['id'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      isTrending: json['isTrending'] ?? false,
      isDealOfTheDay: json['isDealOfTheDay'] ?? false,
      priceD: (json['priceD'] ?? 0.0).toDouble(),
      rating: json['rating'] ?? 0,
      stock: json['stock'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
