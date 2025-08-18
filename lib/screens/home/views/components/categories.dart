import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/constants/app_sizes.dart';
import 'package:shop/route/screen_export.dart';

import '../../../../constants.dart';

class CategoryModel {
  final String name;

  final String? imageUrl, route;

  CategoryModel({
    required this.name,
    required this.imageUrl,
    this.route,
  });
}

List<CategoryModel> demoCategories = [
  CategoryModel(
      name: "Tiles",
      imageUrl:
          'https://img.freepik.com/premium-photo/modern-ceramic-tiles-display-luxury-shopping-mall-shopping-mall-sell-ceramic-materials-tile_255667-81169.jpg?uid=R154965348&ga=GA1.1.2076787137.1740126067&semt=ais_hybrid',
      route: 'dummy0'),
  CategoryModel(
      name: "Bathroom Tiles",
      imageUrl:
          "https://img.freepik.com/free-photo/still-life-putting-up-decorative-vinyls_23-2149683466.jpg?uid=R154965348&ga=GA1.1.2076787137.1740126067&semt=ais_hybrid",
      route: 'dummy1'),
  CategoryModel(
      name: "Floor Tiles",
      imageUrl:
          "https://img.freepik.com/free-vector/realistic-ceramic-set-with-pieces-rectangular-facing-tile-with-different-color-patterns-editable-text_1284-31834.jpg?uid=R154965348&ga=GA1.1.2076787137.1740126067&semt=ais_hybrid",
      route: 'dummy2'),
  CategoryModel(
      name: "Imported Tiles",
      imageUrl:
          "https://img.freepik.com/free-vector/colored-realistic-ceramic-floor-tiles-icon-set-different-types-colors-patterns_1284-29011.jpg?uid=R154965348&ga=GA1.1.2076787137.1740126067&semt=ais_hybrid",
      route: 'dummy3'),
  CategoryModel(
      name: "Sanitary Ware",
      imageUrl:
          "https://img.freepik.com/premium-photo/top-wrench-disassembled-faucet-with-copyspace_696657-638.jpg?uid=R154965348&ga=GA1.1.2076787137.1740126067&semt=ais_hybrid",
      route: 'dummy4'),
];

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demoCategories.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? defaultPadding : defaultPadding / 2,
              right: index == demoCategories.length - 1 ? defaultPadding : 0,
            ),
            child: CategoryBtn(
              category: demoCategories[index].name,
              Imageurl: demoCategories[index].imageUrl ?? '',
              press: () {
                if (demoCategories[index].route != null) {
               context.goNamed(demoCategories[index].route!);

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Route not defined!")),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    required this.Imageurl,
    required this.press,
  });

  final String category;
  final String Imageurl;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: press,
            borderRadius: const BorderRadius.all(Radius.circular(35)),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(Imageurl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
     gapH4,
          Text(
            category,
            style:  TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color:Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
