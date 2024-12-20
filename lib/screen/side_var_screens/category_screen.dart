import 'package:app_web/controllers/subcategory_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../controllers/category_controller.dart';
import 'widgets/category_widget.dart';

class categoryScreen extends StatefulWidget {
  static const String id = '/category-screen';
  const categoryScreen({super.key});

  @override
  State<categoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<categoryScreen> {
  dynamic _image;
  dynamic _bannerImage;
  late String name; // Use Uint8List to hold byte data for the image

  final SubcategoryController subcategoryController = SubcategoryController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController _categoryController = CategoryController();

  String categoryName = ''; // Initialize category name as an empty string

  Future<void> pickImage() async {
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

  Future<void> pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    }
  }

  // void saveCategory() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save(); // Save the form state
  //     _categoryController.uploadCategory(
  //       pickedImage: _image,
  //       pickedBanner: _bannerImage,
  //       name: categoryName,
  //       context:context
  //     );

  //     print("Category Name: $categoryName");
  //     // Add additional save logic here
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Category Screen")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Divider(
                  color: Colors.amber,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Center(
                      child: _image != null
                          ? Image.memory(_image!)
                          : const Text("Category image"),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Container(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        categoryName = value;
                      },
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "Please enter category name";
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Enter your category name",
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Category Name: $categoryName");
                      }
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    // onPressed: saveCategory,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); // Save the form state
                        _categoryController.uploadCategory(
                            pickedImage: _image,
                            pickedBanner: _bannerImage,
                            name: categoryName,
                            context: context);

                        print("Category Name: $categoryName");
                        // Add additional save logic here
                      }
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: pickImage,
                  child: const Text("Pick Image"),
                ),
              ),
              const Divider(
                color: Colors.amber,
              ),
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
                  child: _bannerImage != null
                      ? Image.memory(_bannerImage)
                      : const Text(
                          "Categroy Banner",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  pickBannerImage();
                },
                child: const Text("Pick  banner Image"),
              ),
              Divider(
                color: Colors.grey,
              ),
              CategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
