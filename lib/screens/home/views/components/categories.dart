import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/Data/Provider.dart';

import '../../../../constants.dart';

class CategoryModel {
  final String name;
  final String? imageUrl;

  CategoryModel({
    required this.name,
    required this.imageUrl,
  });
}

List<CategoryModel> demoCategories = [
  CategoryModel(
    name: "Drinks",
    imageUrl:
        'https://ablequalityrestaurantandbar.com/wp-content/uploads/2024/04/fizzy-drinks-v0-yyr6vtruhzbb1-600x400.webp',
  ),
  CategoryModel(
    name: "Coffee & Beverages",
    imageUrl:
        "https://thebarista.co.uk/wp-content/uploads/2022/06/pexels-royston-d-souza-4728009-1.jpg",
  ),
  CategoryModel(
    name: "Noodles",
    imageUrl:
        "https://i0.wp.com/blog.themalamarket.com/wp-content/uploads/2024/06/Vegetarian-pulled-noodles-lead-more-sat.jpg?resize=1200%2C900&ssl=1",
  ),
  CategoryModel(
    name: "Canned Food",
    imageUrl:
        "https://extension.umaine.edu/food-health/wp-content/uploads/sites/9/2022/12/Canned-Food-Blog.png",
  ),
  CategoryModel(
    name: "Grocery",
    imageUrl:
        "https://hips.hearstapps.com/hmg-prod/images/healthy-groceries-bag-66eaef810acf6.jpg?resize=1200:*",
  ),
];

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demoCategories.length,
          (index) {
            final category = demoCategories[index];
            return Padding(
              padding: const EdgeInsets.only(left: 18),
              child: InkWell(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state =
                      category.name;
                  ref.read(navigationProvider.notifier).setIndex(1);
                },
                borderRadius: const BorderRadius.all(Radius.circular(35)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.5)),
                        image: DecorationImage(
                          image: NetworkImage(category.imageUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
