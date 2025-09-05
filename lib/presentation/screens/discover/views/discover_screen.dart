// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shop/data/JsonData.dart';
// import 'package:shop/core/constants/constants.dart';
// import 'package:shop/models/item_model.dart';
// import 'package:shop/models/product_model.dart';
// import 'package:shop/presentation/components/product/product_card.dart';
// import 'package:shop/presentation/screens/discover/views/components/discover_categoryBtn.dart';
// import 'package:shop/presentation/screens/product/product_details_screen.dart';
// import 'package:shop/providers/product_providers.dart';

// class DiscoverScreen extends ConsumerStatefulWidget {
//   final String? selectedCategory;

//   const DiscoverScreen({super.key, this.selectedCategory});

//   @override
//   _DiscoverScreenState createState() => _DiscoverScreenState();
// }

// class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
//   late String selectedCategory;
//   String searchQuery = "";

//   @override
//   void initState() {
//     super.initState();

//     selectedCategory = widget.selectedCategory ?? "All";
//   }

//   @override
//   Widget build(BuildContext context) {
//     final asyncProducts = ref.watch(getItemsProvider('0', '0'));

//     final categoriesAsync = ref.watch(getCategoriesProvider);

//     return Scaffold(
//       body: RefreshIndicator(
//         color: primaryColor,
//         backgroundColor: Colors.white,
//         onRefresh: () async {
//           await Future.delayed(const Duration(seconds: 3));
//           setState(() {});
//         },
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 10, right: 10, bottom: defaultPadding),
//                 child: TextFormField(
//                   cursorColor: primaryColor,
//                   onChanged: (value) {
//                     setState(() {
//                       searchQuery = value;
//                     });
//                   },
//                   textInputAction: TextInputAction.search,
//                   decoration: InputDecoration(
//                     hintText: "Search...",
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.grey.withValues(alpha: 0.15),
//                         width: 1.0,
//                       ),
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.grey.withValues(alpha: 0.15),
//                         width: 1.0,
//                       ),
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     ),
//                     prefixIcon: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 6),
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.grey.withValues(alpha: 0.07)),
//                         child: SvgPicture.asset(
//                           "assets/icons/Search.svg",
//                           height: 22,
//                           color: Theme.of(context)
//                               .iconTheme
//                               .color!
//                               .withValues(alpha: 0.3),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: defaultPadding + 2),
//                       child: CategoryButton(
//                         category: "All",
//                         isActive: selectedCategory == "All",
//                         press: () {
//                           setState(() {
//                             selectedCategory = "All";
//                           });
//                         },
//                       ),
//                     ),
//                     categoriesAsync.when(
//                       data: (categories) {
//                         return Row(
//                           children: [
//                             ...categories.map((category) {
//                               final name = category.name;
//                               bool isActive = selectedCategory == name;

//                               return Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: defaultPadding / 2),
//                                 child: CategoryButton(
//                                   category: name,
//                                   isActive: isActive,
//                                   press: () {
//                                     setState(() {
//                                       selectedCategory = name;
//                                     });
//                                   },
//                                 ),
//                               );
//                             }).toList(),
//                           ],
//                         );
//                       },
//                       loading: () =>
//                           const Center(child: CircularProgressIndicator()),
//                       error: (err, stack) => Center(child: Text('Error: $err')),
//                     ),
//                   ],
//                 ),
//               ),
//               asyncProducts.when(
//                 data: (allProducts) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: defaultPadding,
//                           vertical: defaultPadding / 2,
//                         ),
//                         child: Text(
//                           "${allProducts.length} Products",
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                       ),
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(defaultPadding),
//                           child: SingleChildScrollView(
//                             child: Wrap(
//                               spacing: 13,
//                               runSpacing: 10,
//                               children: allProducts.map((product) {
//                                 return SizedBox(
//                                   width: (MediaQuery.of(context).size.width -
//                                           (3 * defaultPadding)) /
//                                       2,
//                                   child: ProductCard(
//                                     product: product,
//                                     press: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (_) => ProductDetailsScreen(
//                                             product: product,
//                                             images: [
//                                               product.images.isNotEmpty
//                                                   ? product.images.first.src
//                                                   : ''
//                                             ],
//                                              title: product.category,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     brandName: product.brand,
//                                     title: product.category,
//                                     price:
//                                         double.tryParse(product.price) ?? 0.0,
//                                     images: [
//                                       product.images.isNotEmpty
//                                           ? product.images.first.src
//                                           : ''
//                                     ],
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//                 loading: () => const Center(child: CircularProgressIndicator()),
//                 error: (err, _) => Center(child: Text("Error: $err")),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/presentation/components/product/product_card.dart';
import 'package:shop/presentation/screens/discover/views/components/discover_categoryBtn.dart';
import 'package:shop/presentation/screens/product/product_details_screen.dart';
import 'package:shop/providers/product_providers.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  final String? selectedCategory;

  const DiscoverScreen({super.key, this.selectedCategory});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  late String selectedCategoryName;
  String selectedCategoryId = "0";
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    selectedCategoryName = widget.selectedCategory ?? "All";
    selectedCategoryId = "0";
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Pass correct IDs
    final asyncProducts = ref.watch(getItemsProvider(selectedCategoryId, "0"));
    final categoriesAsync = ref.watch(getCategoriesProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar ...

            // Categories Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: defaultPadding + 2),
                    child: CategoryButton(
                      category: "All",
                      isActive: selectedCategoryName == "All",
                      press: () {
                        setState(() {
                          selectedCategoryName = "All";
                          selectedCategoryId = "0"; 
                        });
                      },
                    ),
                  ),
                  categoriesAsync.when(
                    data: (categories) {
                      return Row(
                        children: [
                          ...categories.map((category) {
                            final name = category.name;
                            final id = category.id; 
                            bool isActive = selectedCategoryName == name;

                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: defaultPadding / 2),
                              child: CategoryButton(
                                category: name,
                                isActive: isActive,
                                press: () {
                                  setState(() {
                                    selectedCategoryName = name;
                                    selectedCategoryId = 'id';
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ],
                      );
                    },
                    loading: () => const Padding(
                        padding: EdgeInsets.all(10),
                        child: CircularProgressIndicator()),
                    error: (err, stack) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Error: $err")),
                  ),
                ],
              ),
            ),
            asyncProducts.when(
              data: (allProducts) {
               

                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding / 2,
                        ),
                        child: Text(
                          "${allProducts.length} Products",
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
                              children: allProducts.map((product) {
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
                                            images: [
                                              product.images.isNotEmpty
                                                  ? product.images.first.src
                                                  : ''
                                            ],
                                            title: product.category,
                                          ),
                                        ),
                                      );
                                    },
                                    brandName: product.brand,
                                    title: product.category,
                                    price:
                                        double.tryParse(product.price) ?? 0.0,
                                    images: [
                                      product.images.isNotEmpty
                                          ? product.images.first.src
                                          : ''
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () => const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (err, _) => Expanded(
                child: Center(child: Text("Error: $err")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
