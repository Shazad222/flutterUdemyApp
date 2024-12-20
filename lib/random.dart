import 'package:flutter/material.dart';

class RandomFile extends StatefulWidget {
  const RandomFile({super.key});

  @override
  State<RandomFile> createState() => _RandomFileState();
}

class _RandomFileState extends State<RandomFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Column(
          children: [
            Center(
              child: Text("data"),
            ),
            Center(
              child: Text(
                "we are Going to keep",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
