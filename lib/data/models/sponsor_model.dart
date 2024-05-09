class SponsorModel {
  final String brandName;
  final String image;
  final String offerDescription;

  SponsorModel({required this.brandName, required this.image, required this.offerDescription});

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
        brandName: json['brandName'] ?? "",
        image: json['image'] ?? "",
        offerDescription: json['offerDescription'] ?? "");
  }
}
