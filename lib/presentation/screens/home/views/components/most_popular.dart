// // import 'package:flutter/material.dart';
// // import 'package:shop/components/product/secondary_product_card.dart';
// // import 'package:shop/constants/app_sizes.dart';
// // import 'package:shop/models/product_model.dart';
// // import 'package:shop/screens/product/views/product_details_screen.dart';

// // import '../../../../constants.dart';
// // import '../../../../route/route_constants.dart';

// // class MostPopular extends StatelessWidget {
// //   const MostPopular({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //  gapH8,        Padding(
// //           padding: const EdgeInsets.all(defaultPadding),
// //           child: Text(
// //             "Most popular",
// //             style: Theme.of(context).textTheme.titleSmall,
// //           ),
// //         ),
// //         // While loading use 👇
// //         // SeconderyProductsSkelton(),
// //         SizedBox(
// //           height: 114,
// //           child: ListView.builder(
// //             scrollDirection: Axis.horizontal,
// //             // Find demoPopularProducts on models/ProductModel.dart
// //             itemCount: tilesProducts.length,
// //             itemBuilder: (context, index) => Padding(
// //               padding: EdgeInsets.only(
// //                 left: defaultPadding,
// //                 right: index == tilesProducts.length - 1
// //                     ? defaultPadding
// //                     : 0,
// //               ),
// //               child: SecondaryProductCard(
// //                 image: tilesProducts[index].image,
// //                 brandName: tilesProducts[index].brandName,
// //                 title: tilesProducts[index].title,
// //                 price: tilesProducts[index].price,
// //              //   priceAfetDiscount: tilesProducts[index].priceAfetDiscount,
// //                 discountPercent: tilesProducts[index].dicountpercent,
// //                 onPress: () {
// //                 Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                           builder: (_) => ProductDetailsScreen(
// //                             description: tilesProducts[index].description ?? 'No Description...',
// //                              product: tilesProducts[index], tilesProducts:tilesProducts,
// //                               images: [tilesProducts[index].image.toString()],
// //                               title: tilesProducts[index].brandName,
// //                               subtitle: tilesProducts[index].title,
// //                               discPrice: tilesProducts[index].price,
// //                               price: tilesProducts[index].priceAfetDiscount??tilesProducts[index].price,)));
// //                 },
// //               ),
// //             ),
// //           ),
// //         )
// //       ],
// //     );
// //   }
// // }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shop/presentation/components/product/product_card.dart';

// import 'dart:math';
// import 'package:shop/data/JsonData.dart';
// import 'package:shop/core/constants/constants.dart';
// import 'package:shop/core/constants/app_sizes.dart';
// import 'package:shop/models/product_model.dart';
// import 'package:shop/presentation/screens/product/product_details_screen.dart';

// class MostPopular extends StatefulWidget {
//   const MostPopular({super.key});

//   @override
//   State<MostPopular> createState() => _MostPopularState();
// }

// class _MostPopularState extends State<MostPopular> {
//   late List<ProductModel0> randomProducts;

//   @override
//   void initState() {
//     super.initState();
//     pickRandomProducts();
//   }

//   void pickRandomProducts() {
//     final parsed = jsonDecode(jsonData) as List<dynamic>;
//     List<ProductModel0> products =
//         parsed.map((e) => ProductModel0.fromJson(e)).toList();

//     products.shuffle(Random());

//     setState(() {
//       randomProducts = products.take(10).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         gapH8,
//         Padding(
//           padding: const EdgeInsets.all(defaultPadding),
//           child: Text(
//             "New Arrivals",
//             style: Theme.of(context).textTheme.titleSmall,
//           ),
//         ),
//         SizedBox(
//           height: 190, 
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: randomProducts.length,
//             padding: EdgeInsets.symmetric(horizontal: 12),
//             itemBuilder: (context, index) {
//               final product = randomProducts[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 6),
//                 child: SizedBox(
//                   width: 140,
//                   child: ProductCard(
//                     image: product.image.toString(),
//                     brandName: product.brandName ?? "",
//                     title: product.title,
//                     price: product.price,
//                     product: product,
//                     press: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => ProductDetailsScreen(
//                             product: product,
//                             image: product.image,
//                             title: product.title,
//                           ),
//                         ),
//                       );
//                     },
//                     onTapButton: () {},
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/item_model.dart';
import 'package:shop/presentation/components/product/product_card.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart'; 
import 'package:shop/providers/product_providers.dart';

class MostPopular extends ConsumerWidget {
  final String categoryId;
  final String brandId;

  const MostPopular({
    super.key,
    this.categoryId = "0",  
    this.brandId = "0",     
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(getItemsProvider(categoryId, brandId));

    return asyncItems.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        final products = items;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH8,
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "New Arrivals",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) {
                  final productItem = products[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SizedBox(
                      width: 140,
                      child: ProductCard(
                        images:[productItem.images.isNotEmpty ? productItem.images.first.src : ''],                        brandName: productItem.brand,
                        title: productItem.description,
                        price: double.tryParse(productItem.price) ?? 0.0,
                        product: productItem,
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => ProductDetailsScreen(
                          //       product: product,
                          //       image: product.image,
                          //       title: product.title,
                          //     ),
                          //   ),
                          // );
                        },
                        onTapButton: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}
