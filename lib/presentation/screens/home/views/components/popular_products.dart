import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/models/item_model.dart';
import 'package:shop/presentation/components/product/product_card.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart'; 
import 'package:shop/providers/product_providers.dart';

class PopularProducts extends ConsumerWidget {
  final String categoryId;
  final String brandId;

  const PopularProducts({
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
                "Popular Products",
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
