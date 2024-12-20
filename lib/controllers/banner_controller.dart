import 'dart:convert';
import 'package:app_web/global_variable.dart';
import 'package:app_web/models/banner.dart';
import 'package:app_web/services/manage_http_response.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Below is the code of controller
class BannerController {
  uploadBanner({
    required dynamic pickedImage,
    required context,
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
      BannerModel bannerModel = BannerModel(id: "", image: image);

      http.Response response = await http.post(
        Uri.parse("$uri/api/banner"),
        body: jsonEncode(bannerModel.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          print("Category uploaded successfully.");
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("File uploading category: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();
        return banners;
      } else {
        throw Exception("Faild to load Banners");
      }
    } catch (e) {
      throw Exception("Error loading Banners");
    }
  }

// load the uploaded category
}
