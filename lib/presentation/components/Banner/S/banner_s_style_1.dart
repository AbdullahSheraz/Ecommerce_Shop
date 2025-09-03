import 'package:flutter/material.dart';
import 'package:shop/core/constants/app_sizes.dart';
import '../banner_discount_tag.dart';

import 'package:shop/core/constants/constants.dart';
import 'banner_s.dart';

class BannerSStyle1 extends StatelessWidget {
  const BannerSStyle1({
    super.key,
    this.image = "assets/images/S1.jpg",
    required this.title,
    required this.press,
    this.subtitle,
    required this.discountParcent,
  });
  final String? image;
  final String title;
  final String? subtitle;
  final int discountParcent;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: grandisExtendedFont,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
gapH4,                    if (subtitle != null)
                      Text(
                        subtitle!.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, ),
          child: Align(
            alignment: Alignment.topRight,
            child: BannerDiscountTag(
              percentage: discountParcent,
              height: 56,
            ),
          ),
        ),
      ],
    );
  }
}
