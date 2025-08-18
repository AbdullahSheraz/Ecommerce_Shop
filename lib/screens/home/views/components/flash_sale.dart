import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/screens/product/views/product_details_screen.dart';

import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../components/product/product_card.dart';
import '../../../../constants.dart';
import '../../../../models/product_model.dart';

class FlashSale extends ConsumerWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerMWithCounterSkelton(),
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
     gapH8,
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
       
            // Find demoFlashSaleProducts on models/ProductModel.dart
            itemCount: tilesProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == tilesProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                image: tilesProducts[index].image.toString(),
                brandName: tilesProducts[index].brandName,
                title: tilesProducts[index].title,
                price: tilesProducts[index].price,
             
                discountPercent: tilesProducts[index].dicountpercent,
                press: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            description: tilesProducts[index].description ?? 'No Description...',
                             product: tilesProducts[index], tilesProducts:tilesProducts,
                              images: [tilesProducts[index].image.toString()],
                              title: tilesProducts[index].brandName,
                              subtitle: tilesProducts[index].title,
                              discPrice: tilesProducts[index].price,
                              price: tilesProducts[index].priceAfetDiscount??tilesProducts[index].price,)));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
