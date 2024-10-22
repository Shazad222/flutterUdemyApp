import 'package:flutter/material.dart';
import 'package:pdf_viewer_app/fai.dart';

import 'view/screens/authentication_screen/Login_screen.dart';

void main() {
  runApp(PdfViewerApp());
}

class PdfViewerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Calling the LoginScreen here
    );
  }
}
