import 'package:flutter/material.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/route/screen_export.dart';

import '../../../../constants.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH8,
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Popular products",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: tilesProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == tilesProducts.length - 1 ? defaultPadding : 0,
              ),
              child: ProductCard(
                image: tilesProducts[index].image.toString(),
                brandName: tilesProducts[index].brandName,
                title: tilesProducts[index].title,
                price: tilesProducts[index].price,
                priceAfterDiscount: tilesProducts[index].priceAfetDiscount,
                discountPercent: tilesProducts[index].dicountpercent,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                           description: tilesProducts[index].description ?? 'No Description...',
                              images: [tilesProducts[index].image.toString()],
                              title: tilesProducts[index].brandName,
                              subtitle: tilesProducts[index].title,
                              discPrice: tilesProducts[index].price,
                              price: tilesProducts[index].priceAfetDiscount??tilesProducts[index].price,
                               product: tilesProducts[index], tilesProducts:tilesProducts,)));
                }, 
              ),
            ),
          ),
        )
      ],
    );
  }
}
