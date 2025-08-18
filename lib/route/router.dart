// import 'package:flutter/material.dart';
// import 'package:shop/entry_point.dart';



// import 'screen_export.dart';


// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case onbordingScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const OnBordingScreen(),
//       );
//     case logInScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const LoginScreen(),
//       );
//     case signUpScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const SignUpScreen(),
//       );
  
//     case passwordRecoveryScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const PasswordRecoveryScreen(),
//       );
//       case searchroute:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 1,),
//       );
//        case cartroute:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 3,),
//       );
      
//     case dummyroute:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 1, text: "Tiles"),
//       );
//       case dummyroute2:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 1, text: "Floor Tiles"),
//       );
//       case dummyroute1:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 1, text: "Bathroom Tiles"),
//       );
//       case dummyroute3:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 1, text: "Imported Tiles"),
//       );case dummyroute4:
//       return MaterialPageRoute(
//         builder: (context) => EntryPoint(initialIndex: 1, text: "Sanitary Ware"),
//       );
//     case productReviewsScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const ProductReviewsScreen(),
//       );
//     case homeScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const HomeScreen(),
//       );
//     case discoverScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const DiscoverScreen(),
//       );
//     case onSaleScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const OnSaleScreen(),
//       );
//     case kidsScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const KidsScreen(),
//       );
//     case searchScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const SearchScreen(),
//       );
//     case bookmarkScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const BookmarkScreen(),
//       );
//     case entryPointScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) =>  EntryPoint(),
//       );
//     case profileScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const ProfileScreen(),
//       );
//     case userInfoScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const UserInfoScreen(),
//       );
//     case notificationsScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const NotificationsScreen(),
//       );
//     case noNotificationScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const NoNotificationScreen(),
//       );
//     case enableNotificationScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const EnableNotificationScreen(),
//       );
//     case notificationOptionsScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const NotificationOptionsScreen(),
//       );
//     case addressesScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const AddressesScreen(),
//       );
//     case ordersScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const OrdersScreen(),
//       );
//     case preferencesScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const PreferencesScreen(),
//       );
//     case emptyWalletScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const EmptyWalletScreen(),
//       );
//     case walletScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const WalletScreen(),
//       );
//     case cartScreenRoute:
//       return MaterialPageRoute(
//         builder: (context) => const CartScreen(),
//       );
//     default:
//       return MaterialPageRoute(
//         builder: (context) => const OnBordingScreen(),
//       );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/entry_point.dart';

import 'screen_export.dart';

final GoRouter router = GoRouter(
  initialLocation: '/dum',
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      pageBuilder: (context, state) => _buildPage(const OnBordingScreen()),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      pageBuilder: (context, state) => _buildPage(const LoginScreen()),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      pageBuilder: (context, state) => _buildPage(const SignUpScreen()),
    ),
    GoRoute(
      path: '/password-recovery',
      name: 'passwordRecovery',
      pageBuilder: (context, state) => _buildPage(const PasswordRecoveryScreen()),
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      pageBuilder: (context, state) => _buildPage(EntryPoint(initialIndex: 1)),
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      pageBuilder: (context, state) => _buildPage(EntryPoint(initialIndex: 3)),
    ),
    GoRoute(
      path: '/dum',
      name: 'dum',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 0));
      },
    ),
    GoRoute(
      path: '/dummy',
      name: 'dummy',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 1, text: 'All'));
      },
    ),
    GoRoute(
      path: '/dummy0',
      name: 'dummy0',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 1, text: 'Tiles'));
      },
    ),
    GoRoute(
      path: '/dummy1',
      name: 'dummy1',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 1, text: "Floor Tiles"));
      },
    ),
    GoRoute(
      path: '/dummy2',
      name: 'dummy2',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 1, text: "Bathroom Tiles"));
      },
    ),
    GoRoute(
      path: '/dummy3',
      name: 'dummy3',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 1, text: "Imported Tiles"));
      },
    ),
    GoRoute(
      path: '/dummy4',
      name: 'dummy4',
      pageBuilder: (context, state) {
        return _buildPage(EntryPoint(initialIndex: 1, text: "Sanitary Ware"));
      },
    ),
    GoRoute(
      path: '/product-reviews',
      name: 'productReviews',
      pageBuilder: (context, state) => _buildPage(const ProductReviewsScreen()),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => _buildPage(const HomeScreen()),
    ),
    GoRoute(
      path: '/discover',
      name: 'discover',
      pageBuilder: (context, state) => _buildPage(const DiscoverScreen()),
    ),
    GoRoute(
      path: '/on-sale',
      name: 'onSale',
      pageBuilder: (context, state) => _buildPage(const OnSaleScreen()),
    ),
    GoRoute(
      path: '/kids',
      name: 'kids',
      pageBuilder: (context, state) => _buildPage(const KidsScreen()),
    ),
    GoRoute(
      path: '/search-screen',
      name: 'searchScreen',
      pageBuilder: (context, state) => _buildPage(const SearchScreen()),
    ),
    GoRoute(
      path: '/bookmark',
      name: 'bookmark',
      pageBuilder: (context, state) => _buildPage(const BookmarkScreen()),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      pageBuilder: (context, state) => _buildPage(const ProfileScreen()),
    ),
    GoRoute(
      path: '/user-info',
      name: 'userInfo',
      pageBuilder: (context, state) => _buildPage(const UserInfoScreen()),
    ),
    GoRoute(
      path: '/notifications',
      name: 'notifications',
      pageBuilder: (context, state) => _buildPage(const NotificationsScreen()),
    ),
    GoRoute(
      path: '/no-notifications',
      name: 'noNotifications',
      pageBuilder: (context, state) => _buildPage(const NoNotificationScreen()),
    ),
    GoRoute(
      path: '/enable-notifications',
      name: 'enableNotifications',
      pageBuilder: (context, state) => _buildPage(const EnableNotificationScreen()),
    ),
    GoRoute(
      path: '/notification-options',
      name: 'notificationOptions',
      pageBuilder: (context, state) => _buildPage(const NotificationOptionsScreen()),
    ),
    GoRoute(
      path: '/addresses',
      name: 'addresses',
      pageBuilder: (context, state) => _buildPage(const AddressesScreen()),
    ),
    GoRoute(
      path: '/orders',
      name: 'orders',
      pageBuilder: (context, state) => _buildPage(const OrdersScreen()),
    ),
    GoRoute(
      path: '/preferences',
      name: 'preferences',
      pageBuilder: (context, state) => _buildPage(const PreferencesScreen()),
    ),
    GoRoute(
      path: '/empty-wallet',
      name: 'emptyWallet',
      pageBuilder: (context, state) => _buildPage(const EmptyWalletScreen()),
    ),
    GoRoute(
      path: '/wallet',
      name: 'wallet',
      pageBuilder: (context, state) => _buildPage(const WalletScreen()),
    ),
    GoRoute(
      path: '/cart-screen',
      name: 'cartScreen',
      pageBuilder: (context, state) => _buildPage(EntryPoint(initialIndex: 3, text: "Floor Tiles")),
    ),
  ],
  errorPageBuilder: (context, state) => _buildPage(const OnBordingScreen()),
);

CustomTransitionPage _buildPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    },
  );
}
