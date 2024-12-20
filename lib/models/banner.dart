class BannerModel {
  final String id;
  final String image;

  // Constructor allows assigning an empty or default value for `id`
  BannerModel({this.id = "", required this.image});

  // Serialization: Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }

  // Deserialization: Create an object from a JSON map
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? "", // Default to empty string if `id` is null
      image: json['image'] as String,
    );
  }
}
