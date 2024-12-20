import 'dart:convert';

import 'package:app_web/models/category.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global_variable.dart';
import '../services/manage_http_response.dart';

class CategoryController {
  Future<void> uploadCategory({
    required dynamic pickedImage,
    required dynamic pickedBanner,
    required String name,
    required BuildContext context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dlj48j9ay", "l4pizuwf");

      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: "pickedImage",
          folder: "categoryImages",
        ),
      );

      String image = imageResponse.secureUrl;

      CloudinaryResponse bannerResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedBanner,
          identifier: "pickedBanner",
          folder: "categoryImages",
        ),
      );

      String banner = bannerResponse.secureUrl;

      Category category =
          Category(id: "", name: name, image: image, banner: banner);

      http.Response response = await http.post(Uri.parse("$uri/api/categories"),
          body: jsonEncode(category.toJson()),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Category uploaded successfully");
        },
      );
    } catch (e) {
      print("Error uploading category: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error uploading category: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<List<Category>> LoadCategories() async {
    try {
      http.Response response = await http.get(Uri.parse("$uri/api/categories"),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8'
          });
      // print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<Category> categories =
            data.map((category) => Category.fromJson(category)).toList();
        return categories;
      } else {
        throw Exception("failed to load categories");
      }
    } catch (e) {
      throw Exception("Error loading Categories: $e");
    }
  }
}
