import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/providers/product_providers.dart';
 
class BrandsCategory extends ConsumerWidget {
  const BrandsCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brandAsync = ref.watch(getBrandsProvider);

    return brandAsync.when(
      data: (categories) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
               return Padding(
                padding: const EdgeInsets.only(left: 18),
                child: InkWell(
                  onTap: () {
                 
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
                          border: Border.all(color: Colors.grey.withValues(alpha:  0.5)),
                          image: category.imageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(category.imageUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                      gapH4,
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
            }).toList(),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
