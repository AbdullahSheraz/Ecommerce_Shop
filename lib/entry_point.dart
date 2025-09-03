// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:shop/Data/Provider.dart';
// import 'package:shop/constants.dart';
// import 'package:shop/main.dart';
// import 'package:shop/route/screen_export.dart';
// class EntryPoint extends ConsumerStatefulWidget {
//   final int initialIndex;
//   final String? text;

//   EntryPoint({super.key, this.initialIndex = 0, this.text});

//   @override
//   _EntryPointState createState() => _EntryPointState();
// }

// class _EntryPointState extends ConsumerState<EntryPoint> {
//   late List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       const HomeScreen(),
//       Consumer(
//         builder: (context, ref, _) {
//           final selected = ref.watch(selectedCategoryProvider);
//           return DiscoverScreen(selectedCategory: selected);
//         },
//       ),
//       const BookmarkScreen(),
//       const CartScreen(),
//       const ProfileScreen(),
//     ];

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(navigationProvider.notifier).setIndex(widget.initialIndex);
//     });
//   }

//   SvgPicture svgIcon(String src, {Color? color}) {
//     return SvgPicture.asset(
//       src,
//       height: 24,
//       colorFilter: ColorFilter.mode(
//         color ??
//             Theme.of(context).iconTheme.color!.withOpacity(
//                 Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
//         BlendMode.srcIn,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cartItems = ref.watch(cartProvider);
//     final int totalItems = cartItems.length;
//     double totalPrice = 0.0;

//     for (var item in cartItems) {
//       totalPrice += item.price * item.quantity;
//     }

//     final currentIndex = ref.watch(navigationProvider);

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         leading: const SizedBox(),
//         leadingWidth: 0,
//         centerTitle: false,
//         title: SvgPicture.asset(
//           "assets/logo/Shoplon.svg",
//           colorFilter: ColorFilter.mode(
//               Theme.of(context).iconTheme.color!, BlendMode.srcIn),
//           height: 20,
//           width: 100,
//         ),

//       ),
//       body: Stack(
//         children: [
//           _pages[currentIndex],
//           if (currentIndex != 3 && totalItems > 0)
//             Positioned(
//               bottom: 5,
//               left: 16,
//               right: 16,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
//                 decoration: BoxDecoration(
//                   color: Colors.blueGrey.shade900,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Center(
//                   child: ListTile(
//                     minTileHeight: 40,
//                     contentPadding: EdgeInsets.zero,
//                     onTap: () {
//                       ref.read(navigationProvider.notifier).setIndex(3);
//                     },
//                     leading: const Icon(LucideIcons.shoppingCart,
//                         color: Colors.white),
//                     subtitle: Text(
//                       'Item: ${cartItems.length}',
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     title: Text(
//                       'PKR ${totalPrice.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     trailing: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'View ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(width: 5),
//                         Icon(LucideIcons.chevronRight, color: Colors.white),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       bottomNavigationBar: Theme(

//         data: Theme.of(context).copyWith(
//           splashFactory: NoSplash.splashFactory,
//           highlightColor: Colors.transparent,
//         ),
//         child: Container(
//           padding: const EdgeInsets.only(top: defaultPadding / 2),
//           decoration: BoxDecoration(
//             color: Theme.of(context).brightness == Brightness.light
//                 ? Colors.white
//                 : const Color(0xFF101015),
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//             ),
//           ),
//           child: BottomNavigationBar(
//             currentIndex: currentIndex,
//             onTap: (index) {
//               ref.read(navigationProvider.notifier).setIndex(index);
//             },

//             type: BottomNavigationBarType.fixed,
//             selectedFontSize: 12,
//             selectedItemColor: Theme.of(context).brightness == Brightness.light
//                 ? Colors.black
//                 : Colors.white,
//             unselectedItemColor: Colors.grey,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(LucideIcons.house, color: Colors.grey),
//                 activeIcon: Icon(
//                   LucideIcons.house,
//                   color: Theme.of(context).brightness == Brightness.light
//                       ? Colors.black
//                       : Colors.white,
//                 ),
//                 label: "Home",
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(LucideIcons.search, color: Colors.grey),
//                 activeIcon: Icon(
//                   LucideIcons.search,
//                   color: Theme.of(context).brightness == Brightness.light
//                       ? Colors.black
//                       : Colors.white,
//                 ),
//                 label: "Explore",
//               ),
//               BottomNavigationBarItem(
//                 icon: svgIcon("assets/icons/Bookmark.svg", color: Colors.grey),
//                 activeIcon: svgIcon(
//                   "assets/icons/Bookmark.svg",
//                   color: Theme.of(context).brightness == Brightness.light
//                       ? Colors.black
//                       : Colors.white,
//                 ),
//                 label: "Favorite",
//               ),
//               BottomNavigationBarItem(
//                 icon: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     svgIcon("assets/icons/Bag.svg", color: Colors.grey),
//                     if (totalItems > 0)
//                       Positioned(
//                         right: -6,
//                         top: -4,
//                         child: Container(
//                           padding: const EdgeInsets.all(5),
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             totalItems.toString(),
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 activeIcon: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     svgIcon(
//                       "assets/icons/Bag.svg",
//                       color: Theme.of(context).brightness == Brightness.light
//                           ? Colors.black
//                           : Colors.white,
//                     ),
//                     if (totalItems > 0)
//                       Positioned(
//                         right: -6,
//                         top: -4,
//                         child: Container(
//                           padding: const EdgeInsets.all(5),
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: Text(
//                             totalItems.toString(),
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 label: "Cart",
//               ),
//               BottomNavigationBarItem(
//                 icon: svgIcon("assets/icons/Profile.svg", color: Colors.grey),
//                 activeIcon: svgIcon(
//                   "assets/icons/Profile.svg",
//                   color: Theme.of(context).brightness == Brightness.light
//                       ? Colors.black
//                       : Colors.white,
//                 ),
//                 label: "Profile",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/providers/cart_item_provider.dart';
import 'package:shop/providers/navigationbar_provider.dart';
import 'package:shop/core/route/screen_export.dart';

final selectedCategoryProvider = StateProvider<String>((ref) => "All");

class EntryPoint extends ConsumerStatefulWidget {
  final int initialIndex;
  final String? text;

  const EntryPoint({super.key, this.initialIndex = 0, this.text});

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends ConsumerState<EntryPoint> {
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    pages = [
      const HomeScreen(),
      Consumer(
        builder: (context, ref, _) {
          final selected = ref.watch(selectedCategoryProvider);
          return DiscoverScreen(selectedCategory: selected);
        },
      ),
      const BookmarkScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(navigationProvider.notifier).setIndex(widget.initialIndex);
    });
  }

  void onItemTapped(int index) {
    ref.read(navigationProvider.notifier).setIndex(index);
  }

  Widget buildNavItem({
    required IconData outlinedIcon,
    required IconData filledIcon,
    required String label,
    required bool isSelected,
    required int index,
    int? badgeCount,
  }) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.white70,
        onTap: () => onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              height: 2,
              width: isSelected ? 70 : 200,
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor
                    : Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isSelected ? filledIcon : outlinedIcon,
                  color: isSelected ? primaryColor : Colors.grey,
                  size: 24,
                ),
                if (badgeCount != null && badgeCount > 0)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            gapH4,
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 12,
                color: isSelected ? primaryColor : Colors.grey,
              ),
            ),
            gapH8,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navigationProvider);
    final cartItems = ref.watch(cartProvider);
    final totalItems = cartItems.length;
    double totalPrice = 0.0;

    for (var item in cartItems) {
      totalPrice += item.price * item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Text(
          'ITS Demo App',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        actions: [
          if (currentIndex == 0 || currentIndex == 1 || currentIndex == 3)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                onTap: () {
                  context.pushNamed(RoutesName.itemRoute);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withValues(alpha: 0.08)),
                  child: Icon(
                    LucideIcons.bookmark,
                    size: 20,
                    color: Theme.of(context).iconTheme.color!.withAlpha(77),
                  ),
                ),
              ),
            ),
          if (currentIndex == 0 || currentIndex == 1 || currentIndex == 2)
            Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withValues(alpha: 0.08)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(
                    LucideIcons.shoppingCart,
                    size: 20,
                    color: Theme.of(context).iconTheme.color!.withAlpha(77),
                  ),
                  if (totalItems > 0)
                    Positioned(
                      right: -4,
                      top: -4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          totalItems.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
      body: Stack(
        children: [
          pages[currentIndex],
          if (currentIndex != 3 && totalItems > 0)
            Positioned(
              bottom: 5,
              left: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: ListTile(
                    minTileHeight: 40,
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      ref.read(navigationProvider.notifier).setIndex(3);
                    },
                    leading: const Icon(LucideIcons.shoppingCart,
                        color: Colors.white),
                    subtitle: Text(
                      'Item: ${cartItems.length}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    title: Text(
                      'PKR ${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(LucideIcons.chevronRight, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          buildNavItem(
            outlinedIcon: Icons.home_outlined,
            filledIcon: Icons.home,
            label: "Home",
            isSelected: currentIndex == 0,
            index: 0,
          ),
          buildNavItem(
            outlinedIcon: LucideIcons.search,
            filledIcon: LucideIcons.search,
            label: "Explore",
            isSelected: currentIndex == 1,
            index: 1,
          ),
          buildNavItem(
            outlinedIcon: Icons.bookmark_outline,
            filledIcon: Icons.bookmark,
            label: "Favorite",
            isSelected: currentIndex == 2,
            index: 2,
          ),
          buildNavItem(
            outlinedIcon: Icons.shopping_cart_outlined,
            filledIcon: Icons.shopping_cart,
            label: "Cart",
            isSelected: currentIndex == 3,
            index: 3,
            badgeCount: totalItems,
          ),
          buildNavItem(
            outlinedIcon: Icons.person_outline,
            filledIcon: Icons.person,
            label: "Profile",
            isSelected: currentIndex == 4,
            index: 4,
          ),
        ],
      ),
    );
  }
}
