import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/data/JsonData.dart';
import 'package:shop/presentation/components/product/product_card.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/screens/discover/views/components/discover_categoryBtn.dart';
import 'package:shop/presentation/screens/home/views/components/categories.dart';
import 'package:shop/presentation/screens/product/product_details_screen.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  final String? selectedCategory;

  const DiscoverScreen({super.key, this.selectedCategory});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  late String selectedCategory;
  String searchQuery = "";
  late List<ProductModel0> allProducts;

  @override
  void initState() {
    super.initState();
    final parsed = jsonDecode(jsonData) as List<dynamic>;
    allProducts = parsed.map((e) => ProductModel0.fromJson(e)).toList();
    selectedCategory = widget.selectedCategory ?? "All";
  }

  List<ProductModel0> getProducts() {
    List<ProductModel0> products;

    switch (selectedCategory) {
      case "Drinks":
        products = allProducts.where((p) => p.code.startsWith("D")).toList();
        break;
      case "Coffee & Beverages":
        products = allProducts.where((p) => p.code.startsWith("C")).toList();
        break;
      case "Noodles":
        products = allProducts.where((p) => p.code.startsWith("N")).toList();
        break;
      case "Canned Food":
        products = allProducts.where((p) => p.code.startsWith("F")).toList();
        break;
      case "Grocery":
        products = allProducts.where((p) => p.code.startsWith("G")).toList();
        break;
      default:
        products = allProducts;
    }

    products = products
        .where((p) => p.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    products.shuffle(Random());

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator( color: primaryColor,
                  backgroundColor: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          setState(() {});
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: defaultPadding),
                child: TextFormField(
                  cursorColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withValues(alpha: 0.15),
                        width: 1.0,
                      ),
                      borderRadius:const  BorderRadius.all(Radius.circular(30)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withValues(alpha: 0.15),
                        width: 1.0,
                      ),
                      borderRadius:const  BorderRadius.all(Radius.circular(30)),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        padding:const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withValues(alpha: 0.07)),
                        child: SvgPicture.asset(
                          "assets/icons/Search.svg",
                          height: 22,
                      
                          color: Theme.of(context)
                              .iconTheme
                              .color!
                              .withValues(alpha:  0.3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding:const  EdgeInsets.only(left: defaultPadding + 2),
                      child: CategoryButton(
                        category: "All",
                        isActive: selectedCategory == "All",
                        press: () {
                          setState(() {
                            selectedCategory = "All";
                          });
                        },
                      ),
                    ),
                    ...demoCategories.map((category) {
                      bool isActive = selectedCategory == category.name;
                      return Padding(
                        padding:const  EdgeInsets.only(left: defaultPadding / 2),
                        child: CategoryButton(
                          category: category.name,
                          isActive: isActive,
                          press: () {
                            setState(() {
                              selectedCategory = category.name;
                            });
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Text(
                  "${getProducts().length} Products",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 13,
                      runSpacing: 10,
                      children: getProducts().map((product) {
                        return SizedBox(
                          width: (MediaQuery.of(context).size.width -
                                  (3 * defaultPadding)) /
                              2,
                          child: ProductCard(
                            product: product,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ProductDetailsScreen(
                                    product: product,
                                    image: product.image,
                                    title: product.title,
                                  ),
                                ),
                              );
                            },
                            image: product.image,
                            brandName: product.brandName ?? product.code,
                            title: product.title,
                            price: product.price,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
