class Subcategory {
  final String id;
  final String categoryId;
  final String categoryName;
  final String image;
  final String subCategoryName;

  // Constructor
  Subcategory({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.image,
    required this.subCategoryName,
  });

  // Convert a Subcategory object into a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'image': image,
      'subCategoryName': subCategoryName,
    };
  }

  // Create a Subcategory object from a map (JSON)
  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'] ?? '', // Fallback to an empty string if null
      categoryId:
          json['categoryId'] ?? '', // Fallback to an empty string if null
      categoryName:
          json['categoryName'] ?? '', // Fallback to an empty string if null
      image: json['image'] ?? '', // Fallback to an empty string if null
      subCategoryName:
          json['subCategoryName'] ?? '', // Fallback to an empty string if null
    );
  }
}
