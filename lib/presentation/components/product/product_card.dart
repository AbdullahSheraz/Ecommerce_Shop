import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/core/constants/colors.dart' as colors;
import 'package:shop/models/cartItem_model.dart';
import 'package:shop/models/item_model.dart';
import 'package:shop/providers/cart_item_provider.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.images,
    this.product,
    required this.brandName,
    this.onTapButton,
    required this.title,
    required this.price,
    required this.press,
  });

  final String brandName, title;
  final double price;
  final List<String> images;
  final Item? product;
  final Function? onTapButton;

  final VoidCallback press;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    final cartItem = cartItems.firstWhere(
      (item) => item.title == title,
      orElse: () => CartItem(
        image: images.isNotEmpty ? images.first : "",
        price: price.toString(),
        discountPrice: price.toString(),
        brandName: brandName,
        title: title,
        quantity: 0,
      ),
    );

    final bool isInCart = cartItem.quantity > 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 6, right: 6, top: 6, bottom: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(defaultBorderRadious),
        color: Colors.transparent,
      ),
      child: GestureDetector(
        onTap: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        width: double.infinity,
                        imageUrl: images.isNotEmpty ? images.first : '',
                      ),
                    ),
                    // if (discountPercent != null)
                    //   Positioned(
                    //     right: defaultPadding / 2,
                    //     top: defaultPadding / 2,
                    //     child: Container(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 4, vertical: 2),
                    //       decoration: const BoxDecoration(
                    //         color: errorColor,
                    //         borderRadius: BorderRadius.all(
                    //             Radius.circular(defaultBorderRadious)),
                    //       ),
                    //       child: Center(
                    //         child: Text(
                    //           "$discountPercent% off",
                    //           style: const TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 10,
                    //               fontWeight: FontWeight.w500),
                    //         ),
                    //       ),
                    //     ),
                  ),
                ],
              ),
            ),
            gapH4,
            Text(
              brandName.toUpperCase(),
              style:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 14),
            ),
            gapH4, // priceAfterDiscount != null
            //     ? Row(
            //         children: [
            //           Text(
            //             "Rs$priceAfterDiscount",
            //             style: TextStyle(
            //               color: colors.primaryColor,
            //               fontWeight: FontWeight.w500,
            //               fontSize: 10,
            //             ),
            //           ),
            //           gapW4,
            //           Text(
            //             "Rs$price",
            //             style: TextStyle(
            //               color: Theme.of(context).textTheme.bodyMedium!.color,
            //               fontSize: 10,
            //               decoration: TextDecoration.lineThrough,
            //             ),
            //           ),
            //         ],
            //       )
            //     :
            Text(
              "Rs$price",
              style: TextStyle(
                color: colors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
            gapH8,
            if (isInCart)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (cartItem.quantity > 1) {
                        ref
                            .read(cartProvider.notifier)
                            .decrementQuantity(title);
                      } else {
                        ref.read(cartProvider.notifier).removeFromCart(title);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: primaryColor),
                        color: primaryColor,
                      ),
                      child: const Icon(Icons.remove,
                          color: Colors.white, size: 15),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.2)),
                      ),
                      child: Center(
                        child: Text(
                          "${cartItem.quantity}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(cartProvider.notifier).incrementQuantity(title);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: primaryColor),
                        color: primaryColor,
                      ),
                      child:
                          const Icon(Icons.add, color: Colors.white, size: 15),
                    ),
                  ),
                ],
              )
            else
              InkWell(
                onTap: () {
                  ref.read(cartProvider.notifier).addToCart(
                        CartItem(
                          image: images.isNotEmpty ? images.first : "",
                          price: price.toString(),
                          discountPrice: price.toString(),
                          brandName: brandName,
                          title: title,
                        ),
                      );
                  onTapButton?.call();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
