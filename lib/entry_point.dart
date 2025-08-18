import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/constants.dart';
import 'package:shop/main.dart';
import 'package:shop/route/screen_export.dart';


class EntryPoint extends ConsumerStatefulWidget {
  final int initialIndex;
  final String? text;

  EntryPoint({super.key, this.initialIndex = 0, this.text});

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends ConsumerState<EntryPoint> {
  late List<Widget> _pages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pages = [
      const HomeScreen(),
      DiscoverScreen(selectedCategory: widget.text),
      const BookmarkScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  SvgPicture svgIcon(String src, {Color? color}) {
    return SvgPicture.asset(
      src,
      height: 24,
      colorFilter: ColorFilter.mode(
        color ??
            Theme.of(context).iconTheme.color!.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);
    final int totalItems = cartItems.length;
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
        title: SvgPicture.asset(
          "assets/logo/Shoplon.svg",
          colorFilter: ColorFilter.mode(
              Theme.of(context).iconTheme.color!, BlendMode.srcIn),
          height: 20,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {
             context.goNamed('/dummy');

            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodyLarge!.color!,
                  BlendMode.srcIn),
            ),
          ),
         
        ],
      ),
      body: Stack(
        children: [
          _pages[_currentIndex],
          if (_currentIndex != 3 && totalItems > 0)
            Positioned(
              bottom: 5,
              left: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF31B0D8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: ListTile(
                    minTileHeight: 40,
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                     context.goNamed('/cart-screen');

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
     bottomNavigationBar: Theme(
  data: Theme.of(context).copyWith(
    splashFactory: NoSplash.splashFactory, // Disables splash effect
    highlightColor: Colors.transparent, // Removes highlight effect
  ),
  child: Container(
    padding: const EdgeInsets.only(top: defaultPadding / 2),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF101015),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    child: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index != _currentIndex) {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF101015),
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      selectedItemColor: Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white, // Dynamic selection color
      unselectedItemColor: Colors.grey, // Unselected color remains grey
      items: [
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.house, color: Colors.grey),
          activeIcon: Icon(
            LucideIcons.house,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white, // Adjusted based on theme
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.search, color: Colors.grey),
          activeIcon: Icon(
            LucideIcons.search,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: svgIcon("assets/icons/Bookmark.svg", color: Colors.grey),
          activeIcon: svgIcon(
            "assets/icons/Bookmark.svg",
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          label: "Favorite",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              svgIcon("assets/icons/Bag.svg", color: Colors.grey),
              if (totalItems > 0)
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
          activeIcon: Stack(
            clipBehavior: Clip.none,
            children: [
              svgIcon(
                "assets/icons/Bag.svg",
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              if (totalItems > 0)
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
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: svgIcon("assets/icons/Profile.svg", color: Colors.grey),
          activeIcon: svgIcon(
            "assets/icons/Profile.svg",
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          label: "Profile",
        ),
      ],
    ),
  
        ),
      ),
    );
  }
}
