import 'package:app_web/controllers/banner_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadBannerScreen extends StatefulWidget {
  static const String id = '\banner-Screen';

  const UploadBannerScreen({super.key});

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {
  dynamic _image;
  final BannerController _bannerController = BannerController();
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: const Text(
              "upload Screen",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.amber,
          thickness: 2,
        ),
        Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Center(
                child: _image != null
                    ? Image.memory(_image)
                    : const Text("Category image"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                _bannerController.uploadBanner(
                    pickedImage: _image, context: context);
              },
              child: Text("save"),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: Text("picked image"),
            ),
          ],
        ),
      ],
    );
  }
}
