 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
 import 'package:shop/models/item_model.dart';
import 'package:shop/presentation/components/product/secondary_product_card.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
 import 'package:shop/providers/cart_item_provider.dart';
import 'package:shop/presentation/screens/checkout/components/review_payment.dart';
import 'package:shop/providers/product_providers.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  late List<Item> allProducts;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncProducts = ref.watch(getItemsProvider('0', '0'));

    final cartItems = ref.watch(cartProvider);
    double totalPrice = 0.0;

    for (var item in cartItems) {
      final price = double.tryParse(item.price) ?? 0.0;
      totalPrice += price * item.quantity;
    }
    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          setState(() {});
        },
        child: cartItems.isEmpty
            ? Center(
                child: Text(
                  "Cart is Empty",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 16),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeFromCart(item.title);
                                },
                                child: const Icon(LucideIcons.x,
                                    size: 20, color: Colors.grey),
                              ),
                              gapW10,
                              Expanded(
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: item.image,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  title: Text(
                                    item.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 14),
                                  ),
                                  subtitle: Text(
                                    "PKR ${item.price}",
                                    style: const TextStyle(
                                        color: Colors.orange, fontSize: 12),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (item.quantity > 1) {
                                            ref
                                                .read(cartProvider.notifier)
                                                .decrementQuantity(item.title);
                                          } else {
                                            ref
                                                .read(cartProvider.notifier)
                                                .removeFromCart(item.title);
                                          }
                                        },
                                        child: const Icon(Icons.remove,
                                            color: Colors.grey, size: 18),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text("${item.quantity}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? Colors.black
                                                    : Colors.white)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .incrementQuantity(item.title);
                                        },
                                        child: const Icon(Icons.add,
                                            color: Colors.grey, size: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'More Products You May Love',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                      ),
                    ),
                  ),
                  asyncProducts.when(
                    data: (allProducts) {
                      if (allProducts.isEmpty) {
                        return const Center(child: Text("No products found"));
                      }

                      return SizedBox(
                        height: 85,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allProducts.length,
                          padding: const EdgeInsets.only(left: 16),
                          itemBuilder: (context, index) {
                            final product = allProducts[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SecondaryProductCard(
                                onPress: () {
                                },
                                images: [
                                  product.images.isNotEmpty
                                      ? product.images.first.src
                                      : ''
                                ],
                                brandName: product.brand,
                                title: product.description,
                                price: product.price,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    loading: () => const SizedBox(
                      height: 85,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (err, _) => SizedBox(
                      height: 85,
                      child: Center(child: Text("Error: $err")),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => ReviewScreen(
                            totalAmount: totalPrice,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.shopping_cart,
                                color: Colors.white),
                            Text("PKR ${totalPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const Text("REVIEW PAYMENT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ],
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
