import 'package:app_web/controllers/subcategory_controller.dart';
import 'package:app_web/models/category.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../controllers/category_controller.dart';
import 'widgets/Subcategoryscreen.dart';

class SubcategoryScreen extends StatefulWidget {
  static const String id = 'subCategoryScreen';
  const SubcategoryScreen({super.key});

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SubcategoryController _categoryController = SubcategoryController();

  late Future<List<Category>> futureCategories;

  late String name;
  Category? selectedCategory;

  dynamic _image;
  dynamic _bannerImage;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().LoadCategories();
  }

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  pickBannerImage() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Subcategory Screen")),
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
              FutureBuilder<List<Category>>(
                future: futureCategories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No categories available"));
                  } else {
                    return DropdownButton<Category>(
                      value: selectedCategory,
                      items: snapshot.data!.map((Category category) {
                        return DropdownMenuItem<Category>(
                          value: category,
                          child: Text(category.name),
                        );
                      }).toList(),
                      onChanged: (Category? value) {
                        setState(() {
                          selectedCategory = value;
                        });
                        print(selectedCategory!.name);
                      },
                    );
                  }
                },
              ),
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
                      : const Text("SubCategory image"),
                ),
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 200,
                child: TextFormField(
                  onChanged: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter subcategory name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Enter your subcategory name",
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Subcategory Name: $name");
                  }
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await SubcategoryController.uploadSubcategory(
                      context: context, // Pass context here
                      categoryId: selectedCategory!.id,
                      categoryName: selectedCategory!.name,
                      pickedImage: _image,
                      subCategoryName: name,
                    );
                    setState(() {
                      _formKey.currentState!.reset();
                      _image = null;
                      selectedCategory = null;
                    });
                    print("Subcategory Name: $name");
                  }
                },
                child: const Text("Save"),
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
              SubcategoryWidget()
            ],
          ),
        ),
      ),
    );
  }
}
