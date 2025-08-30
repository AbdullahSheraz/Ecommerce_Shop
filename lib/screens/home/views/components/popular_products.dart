import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/components/product/product_card.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/Data/JsonData.dart';
import 'package:shop/constants.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/product/views/product_details_screen.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  late List<ProductModel0> _randomProducts;

  @override
  void initState() {
    super.initState();
    _pickRandomProducts();
  }

  void _pickRandomProducts() {
    final parsed = jsonDecode(jsonData) as List<dynamic>;
    List<ProductModel0> products =
        parsed.map((e) => ProductModel0.fromJson(e)).toList();

    products.shuffle(Random());

    setState(() {
      _randomProducts = products.take(10).toList();
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
          height: 190, // slightly bigger for Add-to-Cart button
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _randomProducts.length,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final product = _randomProducts[index];
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
