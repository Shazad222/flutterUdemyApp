import 'package:app_web/controllers/category_controller.dart';
import 'package:app_web/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  static const String id = "categoryScreen";
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().LoadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Categories"),
            );
          } else {
            final categories = snapshot.data!;
            return SizedBox(
              height:
                  MediaQuery.of(context).size.height, // Set height explicitly
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6, // Number of columns in the grid
                  mainAxisExtent: 120, // Height of each grid item
                  crossAxisSpacing: 8, // Horizontal space between grid items
                  mainAxisSpacing: 8, // Vertical space between grid items
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    // Wrap the category in GestureDetector for interactivity
                    onTap: () {
                      // Add your onTap action here if needed
                    },
                    child: Column(
                      children: [
                        Image.network(
                          category.image,
                          height: 100,
                          width: 100,
                        ),
                        Text(category.name)
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
