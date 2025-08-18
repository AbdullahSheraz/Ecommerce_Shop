import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/models/product_model.dart';
import '../../constants.dart';
import '../network_image_with_loader.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.image,
    this.product,
    required this.brandName,
    this.onTapButton,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.discountPercent,
    required this.press,
  });

  final String image, brandName, title;
  final double price;
  final ProductModel? product;
  final double? priceAfterDiscount;
  final Function? onTapButton;
  final int? discountPercent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    return SizedBox(
    
      width: 140,
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(defaultBorderRadious),
          color: Colors.transparent,
        ),
        child: GestureDetector(
          onTap: press,
          child: Column(
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
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: const BoxDecoration(
                            color: errorColor,
                            borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
                          ),
                          child: Center(
                            child: Text(
                              "$discountPercent% off",
                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                brandName.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 4),
              priceAfterDiscount != null
                  ? Row(
                      children: [
                        Text(
                          "Rs$priceAfterDiscount",
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Rs$price",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyMedium!.color,
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      "Rs$price",
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
              const SizedBox(height: 8),
              if (isInCart)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (cartItem.quantity > 1) {
                          ref.read(cartProvider.notifier).decrementQuantity(title);
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
                        child: const Icon(Icons.remove, color: Colors.white, size: 15),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            "${cartItem.quantity}",
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
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
                        child: const Icon(Icons.add, color: Colors.white, size: 15),
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
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF31B0D8),
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
      ),
    );
  }
}
