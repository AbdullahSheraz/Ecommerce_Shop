import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/providers/cart_item_provider.dart';

class CartButton extends ConsumerWidget {
  const CartButton({
    super.key,
    required this.price,
    this.title = "Add to Cart",
    this.subTitle = "Unit price",
    required this.discPrice,
    required this.press,
  });

  final double price, discPrice;
  final String title, subTitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final isAdded = cartItems.any((item) => item.title == title);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultBorderRadious / 2),
        child: SizedBox(
          height: 64,
          child: Material(
            color: primaryColor,
            clipBehavior: Clip.hardEdge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadious),
              ),
            ),
            child: InkWell(
              onTap: isAdded ? null : press, // Disable button if already added
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rs${price.toStringAsFixed(2)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              // const SizedBox(width: defaultPadding / 4),
                              // Text(
                              //   "Rs:${discPrice.toStringAsFixed(2)}",
                              //   style: TextStyle(
                              //     color: Theme.of(context)
                              //         .textTheme
                              //         .bodyMedium!
                              //         .color,
                              //     fontSize: 10,
                              //     decoration: TextDecoration.lineThrough,
                              //   ),
                              // ),
                            ],
                          ),
                          Text(
                            subTitle,
                            style: const TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      color: Colors.black.withOpacity(0.15),
                      child: Text(
                        isAdded ? "Already Added" : title,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
