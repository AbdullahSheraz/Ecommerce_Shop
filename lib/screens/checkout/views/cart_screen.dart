import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/components/product/secondary_product_card.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/screens/checkout/components/review_payment.dart';
import 'package:shop/screens/product/views/product_details_screen.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  Map<String, int> itemQuantities = {};

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);
    double totalPrice = 0.0;

    for (var item in cartItems) {
      int quantity = itemQuantities[item.title] ?? 1;
      totalPrice += item.price * item.quantity;
    }

    return Scaffold(
      body: RefreshIndicator(
           onRefresh: () async {
    await Future.delayed(const Duration(seconds: 3)); 
    setState(() {});
  },
        child: cartItems.isEmpty
            ? Center(
                child: Text(
                  "Cart is Empty",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        int quantity = itemQuantities[item.title] ?? 1;
        
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 8, bottom: 8, left: 16),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: const Icon(LucideIcons.x,
                                    size: 15, color: Colors.grey),
                                onTap: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeFromCart(item.title);
                                },
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: item.image,
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 15)),
                                  subtitle: Text("PKR ${item.price}",
                                      style: const TextStyle(
                                          color: Colors.orange, fontSize: 10)),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        child: const Icon(Icons.remove,
                                            color: Colors.grey, size: 16),
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
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("${item.quantity}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).brightness ==
                                                          Brightness.light
                                                      ? Colors.black
                                                      : Colors.white)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        child: const Icon(Icons.add,
                                            color: Colors.grey, size: 16),
                                        onTap: () {
                                          ref
                                              .read(cartProvider.notifier)
                                              .incrementQuantity(item.title);
                                        },
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
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        right: defaultPadding, left: defaultPadding),
                    child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tilesProducts.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SecondaryProductCard(
                            image: tilesProducts[index].image,
                            brandName: tilesProducts[index].brandName,
                            title: tilesProducts[index].title,
                            price: tilesProducts[index].price,
                            discountPercent: tilesProducts[index].dicountpercent,
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailsScreen(
                                    description:
                                        tilesProducts[index].description ??
                                            'No Description...',
                                    product: tilesProducts[index],
                                    tilesProducts: tilesProducts,
                                    images: [
                                      tilesProducts[index].image.toString()
                                    ],
                                    title: tilesProducts[index].brandName,
                                    subtitle: tilesProducts[index].title,
                                    discPrice: tilesProducts[index].price,
                                    price:
                                        tilesProducts[index].priceAfetDiscount ??
                                            tilesProducts[index].price,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding-2),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color:Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey[300]!
                                    : Colors.white)),
                    child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, searchroute);
                        },
                        trailing:  Icon(
                          LucideIcons.chevronRight,
                          color: Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                        ),
                        title: Text("Explore More",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        subtitle: Text(
                          "Add more items to cart",
                          style: TextStyle(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                            horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            color: const Color(0xFF31B0D8),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.shopping_cart, color: Colors.white),
                            Text("PKR ${totalPrice.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text("REVIEW PAYMENT",
                                style: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const Icon(Icons.arrow_forward, color: Colors.white),
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
