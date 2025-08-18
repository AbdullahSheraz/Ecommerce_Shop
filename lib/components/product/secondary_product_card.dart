import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/constants/app_sizes.dart';

import '../../constants.dart';
import '../network_image_with_loader.dart';

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
    this.style,
    this.onAddToCart,
  });

  final String image, brandName, title;
  final double price;
  final double? priceAfterDiscount;
  final int? discountPercent;
  final VoidCallback? onPress;
  final VoidCallback? onAddToCart;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return OutlinedButton(
      onPressed: (){},
      style: style ??
          OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              minimumSize: const Size(256, 0),
              maximumSize: const Size(256, double.infinity)),
      child: Stack(
        children: [
          Positioned(
              bottom: 2,
              right: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap:(){
                  ref.read(cartProvider.notifier).addToCart(
                          CartItem(
                            image: image,
                            price: price,
                            discountPrice: priceAfterDiscount ?? price,
                            brandName: brandName,
                            title: title,
                          ),
                        );
                },
                child: Container(
                  child:  Text('Add Cart',style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration:
                      BoxDecoration(
                        color:primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                ),
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.15,
                child: Stack(
                  children: [
                    NetworkImageWithLoader(image, radius: defaultBorderRadious),
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
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    if (onAddToCart != null)
                      Positioned(
                        right: defaultPadding / 2,
                        top: defaultPadding / 2,
                        child: IconButton(
                          onPressed: onAddToCart,
                          icon: const Icon(Icons.add_shopping_cart, size: 18),
                        ),
                      ),
                  ],
                ),
              ),
              gapW4,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        brandName.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 9),
                      ),
                  gapH4,
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14),
                      ),
              gapH4,
                      priceAfterDiscount != null
                          ? Row(
                              children: [
                                Text(
                                  "Rs$priceAfterDiscount",
                                  style: const TextStyle(
                                    color: Color(0xFF31B0D8),
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
                              style: const TextStyle(
                                color: Color(0xFF31B0D8),
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
