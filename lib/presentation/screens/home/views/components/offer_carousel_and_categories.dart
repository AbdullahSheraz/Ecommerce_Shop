import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/route_constants.dart';
import 'package:shop/presentation/screens/home/views/components/brands/brands_category.dart';
 import 'categories/categories.dart';
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
          child: Row(
            children: [
              Text(
                "Browse Categories",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () => context.pushNamed(RoutesName.categoryGridRoute),
                  child: Text(
                    "ViewAll",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black38,
                          decorationThickness: 1,
                        ),
                  )),
            ],
          ),
        ),
        const Categories(),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: 16),
          child: Row(
            children: [
              Text(
                "Browse Brands",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () => context.pushNamed(RoutesName.brandGridRoute),
                  child: Text(
                    "ViewAll",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black38,
                          decorationThickness: 1,
                        ),
                  )),
            ],
          ),
        ),
        const BrandsCategory(),
      ],
    );
  }
}
