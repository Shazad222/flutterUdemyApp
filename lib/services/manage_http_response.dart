import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void managaHttpResponse(
    {required http.Response response, // the Http response form the request
    required BuildContext context, //the context is to show snackbar
    required VoidCallback
        onSuccess // the callback to execute on the successful reponse
    }) {
// Switch statemnet to handle differnt http status code
  switch (response.statusCode) {
    case 200: // indiate successfull request
      onSuccess();
      break;
    case 400: // indicate bad request
      showSnackBar(
        context,
        json.decode(response.body)['msg'],
      );
      break;
    case 500: // indicate server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: // indicate resource was created successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
    ),
  );
}
