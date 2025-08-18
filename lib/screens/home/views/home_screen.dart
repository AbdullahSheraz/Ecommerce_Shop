import 'package:flutter/material.dart';
import 'package:shop/components/Banner/S/banner_s_style_1.dart';
import 'package:shop/components/Banner/S/banner_s_style_5.dart';
import 'package:shop/constants.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/route/screen_export.dart';

import 'components/best_sellers.dart';
import 'components/flash_sale.dart';
import 'components/most_popular.dart';
import 'components/offer_carousel_and_categories.dart';
import 'components/popular_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          setState(() {});
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Top offers carousel + categories
              const SliverToBoxAdapter(child: OffersCarouselAndCategories()),

              // Popular Products
              const SliverToBoxAdapter(child: PopularProducts()),

              // Flash Sale section with spacing
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
                sliver: SliverToBoxAdapter(child: FlashSale()),
              ),

              // Banner Section 1
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    BannerSStyle1(
                      title: "New \nArrival",
                      subtitle: "SPECIAL OFFER",
                      discountParcent: 50,
                      press: () {
                        Navigator.pushNamed(context, onSaleScreenRoute);
                      },
                    ),
                    const SizedBox(height: defaultPadding),
                  ],
                ),
              ),

              // Most Popular section
              const SliverToBoxAdapter(child: MostPopular()),

              // Banner Section 2
              SliverToBoxAdapter(
                child: Column(
                  children: [
                 gapH24,
                    BannerSStyle5(
                      title: "Black \nFriday",
                      subtitle: "50% Off",
                      bottomText: "COLLECTION",
                      press: () {
                        Navigator.pushNamed(context, onSaleScreenRoute);
                      },
                    ),
                     gapH16,
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: BestSellers()),
              const SliverToBoxAdapter(child: gapH64),
              
            ],
          ),
        ),
      ),
    );
  }
}
