import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop/presentation/components/product/product_card.dart';
import 'dart:math';
import 'package:shop/data/JsonData.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/screens/product/product_details_screen.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  late List<ProductModel0> randomProducts;

  @override
  void initState() {
    super.initState();
    pickRandomProducts();
  }

  void pickRandomProducts() {
    final parsed = jsonDecode(jsonData) as List<dynamic>;
    List<ProductModel0> products =
        parsed.map((e) => ProductModel0.fromJson(e)).toList();

    products.shuffle(Random());

    setState(() {
      randomProducts = products.take(10).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            itemCount: randomProducts.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final product = randomProducts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  width: 140,
                  child: ProductCard(
                    image: product.image,
                    brandName: product.brandName ?? "",
                    title: product.title,
                    price: product.price,
                    product: product,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            product: product,
                            image: product.image,
                            title: product.title,
                          ),
                        ),
                      );
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
  }
}
