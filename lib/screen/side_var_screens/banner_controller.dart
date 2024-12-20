// import 'package:app_web/controllers/banner_controller.dart';
// import 'package:flutter/material.dart';

// import '../../models/banner.dart';

// class BannerWidget extends StatefulWidget {
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
