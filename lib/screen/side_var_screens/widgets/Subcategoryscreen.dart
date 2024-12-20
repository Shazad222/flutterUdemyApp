import 'package:flutter/material.dart';
import 'package:app_web/controllers/subcategory_controller.dart';
import 'package:app_web/models/subcategory.dart';

class SubcategoryWidget extends StatefulWidget {
  static const String id = "subcategoryScreen";
  const SubcategoryWidget({super.key});

  @override
  State<SubcategoryWidget> createState() => _SubcategoryWidgetState();
}

class _SubcategoryWidgetState extends State<SubcategoryWidget> {
  late Future<List<Subcategory>> futureSubcategories;

  @override
  void initState() {
    super.initState();
    // Call the loadSubcategories method from SubcategoryController
    futureSubcategories = SubcategoryController().loadSubcategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<Subcategory>>(
        future: futureSubcategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Subcategories available"),
            );
          } else {
            final subcategories = snapshot.data!;
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  mainAxisExtent: 150, // Height of each grid item
                  crossAxisSpacing: 8, // Horizontal space between grid items
                  mainAxisSpacing: 8, // Vertical space between grid items
                ),
                itemCount: subcategories.length,
                itemBuilder: (context, index) {
                  final subcategory = subcategories[index];
                  return GestureDetector(
                    onTap: () {
                      // Add your onTap action here if needed
                    },
                    child: Column(
                      children: [
                        Image.network(
                          subcategory
                              .image, // Display the image from Subcategory model
                          height: 100,
                          width: 100,
                        ),
                        Text(subcategory
                            .subCategoryName) // Display the subcategory name
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
