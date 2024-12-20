import 'package:app_web/controllers/banner_controller.dart';
import 'package:flutter/material.dart';

import '../../../models/banner.dart';

class BannerWidget extends StatefulWidget {
  static const String id =
      '/banner_widget'; // Corrected static ID (used forward slash)
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late Future<List<BannerModel>> futureBanner;

  @override
  void initState() {
    super.initState();
    futureBanner = BannerController().loadBanners(); // Loading banners
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerModel>>(
      future: futureBanner,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No Banner"));
        } else {
          final banners = snapshot.data!;

          return GridView.builder(
            shrinkWrap: true,
            itemCount: banners.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent:
                  200, // Adjust this value to fit the layout better
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final banner = banners[index]; // Fixed index access
              return Image.network(
                banner.image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              );
            },
          );
        }
      },
    );
  }
}

// import 'package:app_web/controllers/banner_controller.dart';
// import 'package:flutter/material.dart';

// import '../../models/banner.dart';

// class BannerWidget extends StatefulWidget {
//   static const String id = '/banner_widget';
//   const BannerWidget({super.key});

//   @override
//   State<BannerWidget> createState() => _BannerWidgetState();
// }

// class _BannerWidgetState extends State<BannerWidget> {
//   late Future<List<BannerModel>> futureBanner;

//   @override
//   void initState() {
//     super.initState();
//     futureBanner = BannerController().loadBanners();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Banner "),
//       ),
//       body: FutureBuilder<List<BannerModel>>(
//         future: futureBanner,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData && snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text("No banners available"),
//             );
//           } else if (snapshot.hasData) {
//             final banners = snapshot.data!;
//             return ListView.builder(
//               itemBuilder: (context, index) {
//                 final banner = banners[index];
//                 return Card(
//                   margin: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                     leading: Image.network(
//                       banner.image,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) =>
//                           const Icon(Icons.broken_image),
//                     ),
//                     title: Text("Banner Id: ${banner.id}"),
//                   ),
//                 );
//               },
//               itemCount: banners.length,
//             );
//           } else {
//             return const Center(
//               child: Text("unexpected error"),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
