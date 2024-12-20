import 'dart:convert';

class Category {
  final String id;
  final String name;
  final String image;
  final String banner;
  // final int version;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.banner,
    // required this.version,
  });

  // Convert a JSON object into a Category instance
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      banner: json['banner'] ?? '',
      // version: json['__v'] ?? 0,
    );
  }

  // Convert a Category instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'banner': banner,
      // '__v': version,
    };
  }
}
