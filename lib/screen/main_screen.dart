import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import 'side_var_screens/banner_controller.dart';
import 'side_var_screens/subcategory_screen.dart';
import 'side_var_screens/widgets/banner_widget.dart';
import 'side_var_screens/buyer_screen.dart';
import 'side_var_screens/category_screen.dart';
import 'side_var_screens/order_screen.dart';
import 'side_var_screens/product_screen.dart';
import 'side_var_screens/upload_banner.dart';
import 'side_var_screens/vender_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = const VenderScreen();

  screenSelector(item) {
    switch (item.route) {
      case buyerScreen.id:
        setState(() {
          _selectedScreen = const buyerScreen();
        });
        break;

      case VenderScreen.id:
        setState(() {
          _selectedScreen = const VenderScreen();
        });
        break;
      case BannerWidget.id:
        setState(() {
          _selectedScreen = const BannerWidget();
        });
        break;
      case OrderScreen.id:
        setState(() {
          _selectedScreen = const OrderScreen();
        });
        break;
      case categoryScreen.id:
        setState(() {
          _selectedScreen = const categoryScreen();
        });
        break;
      case SubcategoryScreen.id:
        setState(() {
          _selectedScreen = const SubcategoryScreen();
        });
        break;
      case UploadBannerScreen.id:
        setState(() {
          _selectedScreen = const UploadBannerScreen();
        });
        break;
      case ProductScreen.id:
        setState(() {
          _selectedScreen = const ProductScreen();
        });
    }
  }

  // final Map<String, Widget> _screens = {
  //   buyerScreen.id: buyerScreen(),
  //   VenderScreen.id: VenderScreen(),
  //   OrderScreen.id: OrderScreen(),
  //   categoryScreen.id: categoryScreen(),
  //   UploadBannerScreen.id: UploadBannerScreen(),
  //   ProductScreen.id: ProductScreen(),
  // };

  // void screenSelector(item) {
  //   setState(() {
  //     _selectedScreen = _screens[item.route] ?? VenderScreen();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Management"),
      ),
      body: _selectedScreen,
      sideBar: SideBar(
        header: Container(
          height: 50,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.amber,
          ),
          child: const Center(
            child: Text(
              "data",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.7),
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 187, 33),
        activeBackgroundColor: Colors.green,
        activeTextStyle: const TextStyle(color: Colors.white),
        items: const [
          AdminMenuItem(
            title: 'Vendor',
            route: VenderScreen.id, // Added correct route
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Banner',
            route: BannerWidget.id, // Added correct route
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyer',
            route: buyerScreen.id, // Added correct route
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: 'Categories',
            route: categoryScreen.id, // Added correct route
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: "Order",
            route: OrderScreen.id, // Added correct route
            icon: Icons.shopping_cart,
          ),
          AdminMenuItem(
            title: "Upload Banner",
            route: UploadBannerScreen.id, // Added correct route
            icon: CupertinoIcons.bandage,
          ),
          AdminMenuItem(
            title: "Products",
            route: ProductScreen.id, // Added correct route
            icon: Icons.store,
          ),
          AdminMenuItem(
            title: "sub Categories",
            route: SubcategoryScreen.id,
            icon: Icons.category_outlined,
          )
        ],
        // selectedRoute: VenderScreen.id,
        selectedRoute: _selectedScreen.runtimeType.toString(),

        // onSelected: (item) => screenSelector(item),

        onSelected: (item) {
          screenSelector(item);
        },
      ),
    );
  }
}
