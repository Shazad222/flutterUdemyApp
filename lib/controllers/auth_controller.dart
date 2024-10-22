import 'dart:convert';

import 'package:pdf_viewer_app/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_viewer_app/services/manage_http_response.dart';

import '../global_variable.dart';

class AuthController {
  Future<void> signUpUser({
    required context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      User user = User(
        id: "",
        fullName: fullName,
        email: email,
        state: "",
        city: "",
        locality: "",
        password: password,
      );
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        headers: <String, String>{
          "Content-Type":
              "application/json; charset=UTF-8", // speicfy the contex type as json
        },
        body: json.decode(user
            .toJson()), // convert the suer object into json for the request body
      );
      managaHttpResponse(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Accound has been created for you ");
          });
    } catch (e) {}
  }
}
