import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/components/network_image_with_loader.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/category_model.dart' as categoryModel;
import 'package:shop/models/product_model.dart';
import 'package:shop/screens/discover/views/components/discover_categoryBtn.dart';
import 'package:shop/screens/discover/views/components/discover_productCard.dart';
import 'package:shop/screens/home/views/components/categories.dart';
import 'package:shop/screens/product/views/product_details_screen.dart';
import 'package:shop/screens/search/views/components/search_form.dart';
import 'package:shop/theme/input_decoration_theme.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  final String? selectedCategory;

  const DiscoverScreen({super.key, this.selectedCategory});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  late String selectedCategory;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.selectedCategory ?? "All";
  }

  List<ProductModel> getProducts() {
    List<ProductModel> products = selectedCategory == "All"
        ? [
            ...tilesProducts,
            ...floorTilesProducts,
            ...bathroomTilesProducts,
            ...importedTilesProducts,
            ...sanitaryWareProducts
          ]
        : selectedCategory == "Floor Tiles"
            ? floorTilesProducts
            : selectedCategory == "Bathroom Tiles"
                ? bathroomTilesProducts
                : selectedCategory == "Imported Tiles"
                    ? importedTilesProducts
                    : selectedCategory == "Sanitary Ware"
                        ? sanitaryWareProducts
                        : tilesProducts;

    return products
        .where((product) =>
            product.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
         onRefresh: () async {
    await Future.delayed(const Duration(seconds: 3)); 
    setState(() {});
  },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: "Find something...",
                    border: secodaryOutlineInputBorder(context),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        "assets/icons/Search.svg",
                        height: 24,
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(0.3),
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
                      padding: EdgeInsets.only(left: defaultPadding + 2),
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
                        padding: EdgeInsets.only(left: defaultPadding / 2),
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
                    }).toList(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Text(
                  "${getProducts().length} Products",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: GridView.builder(
                    itemCount: getProducts().length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: defaultPadding,
                      mainAxisSpacing: defaultPadding,
                      childAspectRatio: 0.67,
                    ),
                    itemBuilder: (context, index) {
                      final product = getProducts()[index];
                      return ProductCard(
                        product: product,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                description:
                                    product.description ?? 'No Description...',
                                images: [product.image.toString()],
                                title: product.brandName,
                                subtitle: product.title,
                                discPrice: product.price,
                                price: product.priceAfetDiscount ?? product.price,
                                product: product,
                                tilesProducts: getProducts(),
                              ),
                            ),
                          );
                        },
                        image: product.image,
                        brandName: product.brandName,
                        title: product.title,
                        price: product.price,
                        priceAfterDiscount: product.priceAfetDiscount,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
