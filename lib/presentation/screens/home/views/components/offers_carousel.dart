import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop/presentation/components/Banner/M/banner_m_style_1.dart';
import 'package:shop/presentation/components/Banner/M/banner_m_style_2.dart';
import 'package:shop/presentation/components/Banner/M/banner_m_style_3.dart';
import 'package:shop/presentation/components/dot_indicators.dart';

import 'package:shop/core/constants/constants.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int selectedIndex = 0;
  late PageController pageController;
  late Timer timer;

  List offers = [
    BannerMStyle1(
      text: "New items with \nFree shipping",
      press: () {},
    ),
    BannerMStyle2(
      title: "Black \nfriday",
      subtitle: "Collection",
      discountParcent: 50,
      press: () {},
    ),
    BannerMStyle3(
      title: "Grab \nyours now",
      discountParcent: 50,
      press: () {},
    ),
  
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (selectedIndex < offers.length - 1) {
        selectedIndex++;
      } else {
        selectedIndex = 0;
      }

      pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: offers.length,
            onPageChanged: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => offers[index],
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    offers.length,
                    (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: DotIndicator(
                          isActive: index == selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
