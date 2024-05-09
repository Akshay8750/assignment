class CategoryModel {
  final String name;
  final String description;
  final String image;
  final bool isActive;

  CategoryModel(
      {required this.name, required this.description, required this.image, this.isActive = true});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        isActive: json['isActive'] ?? true);
  }
}
