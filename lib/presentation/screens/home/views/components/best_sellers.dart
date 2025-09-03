// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop/components/product/product_card.dart';
// import 'package:shop/constants/app_sizes.dart';
// import 'package:shop/models/product_model.dart';
// import 'package:shop/screens/product/views/product_details_screen.dart';
// import '../../../../constants.dart';

// class BestSellers extends ConsumerWidget {
//   const BestSellers({super.key});

//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//     gapH8,
//         Padding(
//           padding: const EdgeInsets.all(defaultPadding),
//           child: Text(
//             "Best sellers",
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//         ),
//         SizedBox(
//           height: 210,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: tilesProducts.length,
//             itemBuilder: (context, index) {
//               final product = tilesProducts[index];
//               return Padding(
//                 padding: EdgeInsets.only(
//                   left: defaultPadding,
//                   right: index == tilesProducts.length - 1 ? defaultPadding : 0,
//                 ),
//                 child: ProductCard(
//                   image: product.image.toString(),
//                   brandName: product.brandName,
//                   title: product.title,
//                   price: product.price,
                 
//                   press: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => ProductDetailsScreen(
//                                   description:
//                                       tilesProducts[index].description ??
//                                           'No Description...',
//                                   product: tilesProducts[index],
//                                   tilesProducts: tilesProducts,
//                                   images: [
//                                     tilesProducts[index].image.toString()
//                                   ],
//                                   title: tilesProducts[index].brandName,
//                                   subtitle: tilesProducts[index].title,
//                                   price:
//                                       tilesProducts[index].priceAfetDiscount ??
//                                           tilesProducts[index].price,
//                                   discPrice: tilesProducts[index].price,
//                                 )));
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
      
//       ],
//     );
//   }
// }
