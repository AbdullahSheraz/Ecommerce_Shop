import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: defaultPadding),
                  child: TextFormField(
                    cursorColor: Colors.black87,
                    onChanged: (value) {
                      // handle search input
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withAlpha(40),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withAlpha(40),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withAlpha(15),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Search.svg",
                            height: 22,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withAlpha(77),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: OffersCarouselAndCategories()),

              const SliverToBoxAdapter(child: PopularProducts()),

              // const SliverPadding(
              //   padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
              //   sliver: SliverToBoxAdapter(child: FlashSale()),
              // ),

              // Banner Section 1
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: defaultPadding),
                    ClipRRect(
                      child: Image.asset('assets/images/S1.jpg',
                          fit: BoxFit.contain, width: double.infinity),
                    ),
                  ],
                ),
              ),

              const SliverToBoxAdapter(child: MostPopular()),

              // SliverToBoxAdapter(
              //   child: Column(
              //     children: [
              //       gapH24,
              //       BannerSStyle5(
              //         title: "Black \nFriday",
              //         subtitle: "50% Off",
              //         bottomText: "COLLECTION",
              //         press: () {
              //           context.goNamed(RoutesName.onSaleScreenRoute);
              //         },
              //       ),
              //       gapH16,
              //     ],
              //   ),
              // ),
              // const SliverToBoxAdapter(child: BestSellers()),
              const SliverToBoxAdapter(child: gapH64),
            ],
          ),
        ),
      ),
    );
  }
}
