// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void manageHttpResponse({
//   required http.Response response,
//   required BuildContext context,
//   required VoidCallback onSuccess,
// }) {
//   try {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         // Success
//         onSuccess();
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Operation successful!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//         break;
//       case 400:
//         // Bad request
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Bad request: ${response.body}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         break;
//       case 401:
//         // Unauthorized
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Unauthorized: Please log in again.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         break;
//       case 403:
//         // Forbidden
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Forbidden: You do not have access.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         break;
//       case 404:
//         // Not found
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Resource not found: ${response.body}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         break;
//       case 500:
//         // Server error
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Server error: Please try again later.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         break;
//       default:
//         // Other errors
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 'Something went wrong: ${response.statusCode} - ${response.body}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//     }
//   } catch (e) {
//     print("Error handling HTTP response: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('An unexpected error occurred.'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  try {
    switch (response.statusCode) {
      case 200:
      case 201:
        // Success
        onSuccess();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Operation successful!'),
            backgroundColor: Colors.green,
          ),
        );
        break;
      case 400:
        // Bad request
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bad request: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
        break;
      case 401:
        // Unauthorized
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unauthorized: Please log in again.'),
            backgroundColor: Colors.red,
          ),
        );
        break;
      case 403:
        // Forbidden
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Forbidden: You do not have access.'),
            backgroundColor: Colors.red,
          ),
        );
        break;
      case 404:
        // Not found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Resource not found: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
        break;
      case 500:
        // Server error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Server error: Please try again later.'),
            backgroundColor: Colors.red,
          ),
        );
        break;
      default:
        // Other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Something went wrong: ${response.statusCode} - ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
    }
  } catch (e) {
    print("Error handling HTTP response: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('An unexpected error occurred.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ),
  );
}
