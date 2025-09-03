import 'package:flutter/material.dart';
import 'package:shop/core/constants/constants.dart';
import 'categories.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const OffersCarousel(),

        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: 16),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      
        const Categories(),
      ],
    );
  }
}
