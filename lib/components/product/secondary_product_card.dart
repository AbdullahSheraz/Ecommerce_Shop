import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/constants.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/constants/colors.dart' as color;

import '../network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/constants.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/constants/colors.dart' as color;

class SecondaryProductCard extends ConsumerWidget {
  const SecondaryProductCard({
    super.key,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.discountPercent,
    this.onPress,
    this.onTapButton,
  });

  final String image, brandName, title;
  final double price;
  final double? priceAfterDiscount;
  final int? discountPercent;
  final VoidCallback? onPress;
  final VoidCallback? onTapButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ get current cart items
    final cartItems = ref.watch(cartProvider);

    final cartItem = cartItems.firstWhere(
      (item) => item.title == title,
      orElse: () => CartItem(
        image: image,
        price: price,
        discountPrice: priceAfterDiscount ?? price,
        brandName: brandName,
        title: title,
        quantity: 0,
      ),
    );

    final bool isInCart = cartItem.quantity > 0;

    return InkWell(
      borderRadius: BorderRadius.circular(defaultBorderRadious),
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(
          minWidth: 256,
          maxWidth: 256,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.15,
              child: Stack(
                children: [
                  Image.asset(image, fit: BoxFit.contain),

                  /// Discount badge
                  if (discountPercent != null)
                    Positioned(
                      right: defaultPadding / 2,
                      top: defaultPadding / 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        height: 16,
                        decoration: const BoxDecoration(
                          color: errorColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(defaultBorderRadious)),
                        ),
                        child: Text(
                          "$discountPercent% off",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            gapW8,

            /// Text + cart section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2,
                    vertical: defaultPadding / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 14),
                    ),
                    // gapH4,
                    // Text(
                    //   brandName.toUpperCase(),
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyMedium!
                    //       .copyWith(fontSize: 9),
                    // ),
                    // gapH4,

                    /// Price
                    priceAfterDiscount != null
                        ? Row(
                            children: [
                              Text(
                                "Rs$priceAfterDiscount",
                                style: TextStyle(
                                  color: color.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ),
                              gapW4,
                              Text(
                                "Rs$price",
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                  fontSize: 10,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "Rs$price",
                            style: TextStyle(
                              color: color.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                    gapH8,

                    /// Cart section
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
                                ref
                                    .read(cartProvider.notifier)
                                    .removeFromCart(title);
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
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey.shade600,
                            ),
                            child: Text(
                              "${cartItem.quantity}",
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .incrementQuantity(title);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: primaryColor),
                                color: primaryColor,
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 15),
                            ),
                          ),
                        ],
                      )
                    else
                      InkWell(
                        onTap: () {
                          ref.read(cartProvider.notifier).addToCart(
                                CartItem(
                                  image: image,
                                  price: price,
                                  discountPrice: priceAfterDiscount ?? price,
                                  brandName: brandName,
                                  title: title,
                                ),
                              );
                          onTapButton?.call();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF1976D2),
                          ),
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
