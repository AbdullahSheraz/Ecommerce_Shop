import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shop/presentation/components/cart_button.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/models/cartItem_model.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/providers/bookmark_provider.dart';
import 'package:shop/providers/cart_item_provider.dart';
import 'package:shop/presentation/screens/product/views/components/notify_me_card.dart';
import 'package:shop/presentation/screens/product/views/components/product_images.dart';
import 'package:shop/presentation/screens/product/views/components/product_info.dart';
import 'package:shop/presentation/screens/product/views/components/product_list_tile.dart';

// class ProductDetailsScreen extends ConsumerWidget {
//   const ProductDetailsScreen({
//     super.key,
//     required this.images,
//     required this.title,
//     required this.subtitle,
//     required this.description,
//     required this.discPrice,
//     required this.price,
//     this.isProductAvailable = true,
//     required this.product,
//     required this.tilesProducts,
//   });

//   final ProductModel0 product;
//   final List<ProductModel0> tilesProducts;

//   final List<String> images;

//   final String title;
//   final String subtitle;
//   final String description;
//   final double price, discPrice;
//   final bool isProductAvailable;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AddData = ref.watch(cartProvider.notifier);
//     return Scaffold(
//       bottomNavigationBar: isProductAvailable
//           ? CartButton(
//               price: price,
//               discPrice: discPrice,
//               press: () {
//                 AddData.addToCart(
//                   CartItem(
//                       image: images[0],
//                       price: price,
//                       discountPrice: discPrice,
//                       brandName: title,
//                       title: subtitle),
//                 );

//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Item added to cart')),
//                 );
//               },
//             )
//           : NotifyMeCard(
//               isNotify: false,
//               onChanged: (value) {},
//             ),
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//               floating: true,
//               actions: [
//                 IconButton(
//                   onPressed: () {
                    // ref.read(bookmarkProvider.notifier).toggleBookmark(product);
//                   },
//                   icon: Consumer(
//                     builder: (context, ref, child) {
//                       final bookmarks = ref.watch(bookmarkProvider);
//                       final isBookmarked = bookmarks.contains(product);

//                       return SvgPicture.asset(
//                         "assets/icons/Bookmark.svg",
//                         color: isBookmarked
//                             ? Color(0xFF31B0D8)
//                             : Colors.grey, // Change color if bookmarked
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             ProductImages(images: images),
//             ProductInfo(
//               brand: title,
//               title: subtitle,
//               isAvailable: isProductAvailable,
//               description: description,
//               rating: 4.4,
//               numOfReviews: 126,
//             ),
//             ProductListTile(
//               svgSrc: "assets/icons/Product.svg",
//               title: "Product Details",
//               press: () {
//                 customModalBottomSheet(
//                   context,
//                   height: MediaQuery.of(context).size.height * 0.92,
//                   child: const BuyFullKit(
//                       images: ["assets/screens/Product detail.png"]),
//                 );
//               },
//             ),
//             ProductListTile(
//               svgSrc: "assets/icons/Delivery.svg",
//               title: "Shipping Information",
//               press: () {
//                 customModalBottomSheet(
//                   context,
//                   height: MediaQuery.of(context).size.height * 0.92,
//                   child: const BuyFullKit(
//                     images: ["assets/screens/Shipping information.png"],
//                   ),
//                 );
//               },
//             ),
//             ProductListTile(
//               svgSrc: "assets/icons/Return.svg",
//               title: "Returns",
//               isShowBottomBorder: true,
//               press: () {
//                 customModalBottomSheet(
//                   context,
//                   height: MediaQuery.of(context).size.height * 0.92,
//                   child: const ProductReturnsScreen(),
//                 );
//               },
//             ),
//             const SliverToBoxAdapter(
//               child: Padding(
//                 padding: EdgeInsets.all(defaultPadding),
//                 child: ReviewCard(
//                   rating: 4.3,
//                   numOfReviews: 128,
//                   numOfFiveStar: 80,
//                   numOfFourStar: 30,
//                   numOfThreeStar: 5,
//                   numOfTwoStar: 4,
//                   numOfOneStar: 1,
//                 ),
//               ),
//             ),
//             ProductListTile(
//               svgSrc: "assets/icons/Chat.svg",
//               title: "Reviews",
//               isShowBottomBorder: true,
//               press: () {
// context.goNamed('productReviews');
//               },
//             ),
//             SliverPadding(
//               padding: const EdgeInsets.all(defaultPadding),
//               sliver: SliverToBoxAdapter(
//                 child: Text(
//                   "You may also like",
//                   style: Theme.of(context).textTheme.titleSmall!,
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: SizedBox(
//                 height: 220,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: tilesProducts.length,
//                   itemBuilder: (context, index) => Padding(
//                     padding: EdgeInsets.only(
//                         left: defaultPadding,
//                         right: index == tilesProducts.length - 1
//                             ? defaultPadding
//                             : 0),
//                     child: ProductCard(
//                       image: tilesProducts[index].image,
//                       title: tilesProducts[index].title,
//                       onTapButton: () {
//                         // ref.watch(cartProvider.notifier).addToCart(
//                         //       CartItem(
//                         //           image: tilesProducts[index].image,
//                         //           price: tilesProducts[index].price,
//                         //           discountPrice:
//                         //               tilesProducts[index].priceAfetDiscount ??
//                         //                   tilesProducts[index].price,
//                         //           brandName: tilesProducts[index].brandName,
//                         //           title: tilesProducts[index].title),
//                         //     );

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Item added to cart')),
//                         );
//                       },
//                       brandName: tilesProducts[index].brandName.toString(),
//                       price: tilesProducts[index].price,
        
//                       press: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (_) => ProductDetailsScreen(
//                         //       product: tilesProducts[index],
//                         //       tilesProducts: tilesProducts,
//                         //     ),
//                         //   ),
//                         // );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SliverToBoxAdapter(
//               child: SizedBox(height: defaultPadding),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class ProductDetailsScreen extends ConsumerWidget {
  const ProductDetailsScreen({
    super.key,
    required this.image,
     this.title='',
    this.product,
    this.tilesProducts = const [],
    this.description = "No description available for this product.",
    this.price = 1000.0,
    this.discPrice = 899.0,
    this.isProductAvailable = true,
  });

  final String image;
  final String title;

  final String description;
  final double price;
  final double discPrice;
  final bool isProductAvailable;

  final ProductModel0? product;
  final List<ProductModel0> tilesProducts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartProvider.notifier);

    return Scaffold(
      bottomNavigationBar: isProductAvailable
          ? CartButton(
              price: price,
              discPrice: discPrice,
              press: () {
                cartNotifier.addToCart(
                  CartItem(
                    image: image,
                    price: price,
                    discountPrice: discPrice,
                    brandName: title,
                    title: title,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item added to cart')),
                );
              },
            )
          : NotifyMeCard(isNotify: false, onChanged: (value) {}),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {
                    ref.read(bookmarkProvider.notifier).toggleBookmark(product!);
                  },
                  icon: Consumer(
                    builder: (context, ref, child) {
                      final bookmarks = ref.watch(bookmarkProvider);
                      final isBookmarked = bookmarks.contains(product);

                      return SvgPicture.asset(
                        "assets/icons/Bookmark.svg",
                        color: isBookmarked
                            ? primaryColor
                            : Colors.grey,
                      );
                    },
                  ),
                ),
              ],
            ),

            ProductImages(images: [image]),

            ProductInfo(
              brand: title,
              title: title,
              isAvailable: isProductAvailable,
              description: description,
              rating: 4.4,
              numOfReviews: 126,
            ),

            ProductListTile(
              svgSrc: "assets/icons/Product.svg",
              title: "Product Details",
              press: () {},
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
