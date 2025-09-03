import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/presentation/components/product/product_card.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/providers/bookmark_provider.dart';

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});

  @override
  ConsumerState<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final bookmarks = ref.watch(bookmarkProvider);

    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: bookmarks.isEmpty
              ? const Center(child: Text("No Favorite Items"))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: 0.67,
                  ),
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    final product = bookmarks[index];
                    return ProductCard(
                      image: product.image,
                      title: product.title,
                      brandName: product.brandName ?? '',
                      price: product.price,
                      onTapButton: () {},
                      press: () {},
                    );
                  },
                ),
        ),
      ),
    );
  }
}
