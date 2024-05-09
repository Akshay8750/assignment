class CarouselModel {
  final String categoryName;
  final String productId;
  final String image;
  final bool isActive;
  final bool isCategory;
  final bool isProduct;

  CarouselModel({
    required this.categoryName,
    required this.productId,
    required this.image,
    this.isActive = true,
    this.isCategory = true,
    this.isProduct = true,
  });

  factory CarouselModel.fromJson(Map<String, dynamic> json) {
    return CarouselModel(
      categoryName: json['categoryName'] ?? "",
      productId: json['productId'] ?? "",
      image: json['image'] ?? "",
      isActive: json['isActive'] ?? true,
      isCategory: json['isCategory'] ?? true,
      isProduct: json['isProduct'] ?? true,
    );
  }
}
