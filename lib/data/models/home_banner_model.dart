class HomeBannerModel {
  final String categoryName;
  final String image;
  final String position;
  final String title;
  final String description;

  HomeBannerModel(
      {required this.categoryName,
      required this.image,
      required this.position,
      required this.title,
      required this.description});

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      categoryName: json['categoryName'] ?? "",
      image: json['image'] ?? "",
      position: json['position'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",

    );
  }
}
