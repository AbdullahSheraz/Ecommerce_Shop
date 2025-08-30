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
import 'package:shop/screens/dummy.dart';

import 'screen_export.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// your imports
// import 'entry_point.dart';
// import 'screen_export.dart';

final GoRouter router = GoRouter(
  initialLocation: '/dum',
  routes: [
    GoRoute(
      path: RoutesPath.onbordingScreenPath,
      name: RoutesName.onbordingScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const OnBordingScreen()),
    ),
    GoRoute(
      path: RoutesPath.logInScreenPath,
      name: RoutesName.logInScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const LoginScreen()),
    ),
    GoRoute(
      path: RoutesPath.signUpScreenPath,
      name: RoutesName.signUpScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const SignUpScreen()),
    ),
    GoRoute(
      path: RoutesPath.passwordRecoveryScreenPath,
      name: RoutesName.passwordRecoveryScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const PasswordRecoveryScreen()),
    ),

    // Search
    GoRoute(
      path: RoutesPath.searchPath,
      name: RoutesName.searchroute,
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1)),
    ),

    GoRoute(
      path: RoutesPath.cartPath, 
      name: RoutesName.cartroute,
      pageBuilder: (context, state) {
        final text = state.extra as String?;
        return _buildPage(
          EntryPoint(initialIndex: 3, text: text),
        );
      },
    ),

    // Dummy routes
    GoRoute(
      path: '/dum',
      name: 'dum',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 0)),
    ),
    GoRoute(
      path: '/dummy',
      name: 'dummy',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1, text: 'All')),
    ),
    GoRoute(
      path: '/dummy0',
      name: 'dummy0',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1, text: 'Tiles')),
    ),
    GoRoute(
      path: '/dummy1',
      name: 'dummy1',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1, text: "Floor Tiles")),
    ),
    GoRoute(
      path: '/dummy2',
      name: 'dummy2',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1, text: "Bathroom Tiles")),
    ),
    GoRoute(
      path: '/dummy3',
      name: 'dummy3',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1, text: "Imported Tiles")),
    ),
    GoRoute(
      path: '/dummy4',
      name: 'dummy4',
      pageBuilder: (context, state) =>
          _buildPage(EntryPoint(initialIndex: 1, text: "Sanitary Ware")),
    ),

    GoRoute(
      path: RoutesPath.productReviewsScreenPath,
      name: RoutesName.productReviewsScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const ProductReviewsScreen()),
    ),
    GoRoute(
      path: RoutesPath.homeScreenPath,
      name: RoutesName.homeScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const HomeScreen()),
    ),
    GoRoute(
      path: RoutesPath.discoverScreenPath,
      name: RoutesName.discoverScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const DiscoverScreen()),
    ),
    GoRoute(
      path: RoutesPath.onSaleScreenPath,
      name: RoutesName.onSaleScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const OnSaleScreen()),
    ),
    GoRoute(
      path: RoutesPath.kidsScreenPath,
      name: RoutesName.kidsScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const KidsScreen()),
    ),
    GoRoute(
      path: RoutesPath.searchScreenPath,
      name: RoutesName.searchScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const SearchScreen()),
    ),
    GoRoute(
      path: RoutesPath.bookmarkScreenPath,
      name: RoutesName.bookmarkScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const BookmarkScreen()),
    ),
    GoRoute(
      path: RoutesPath.profileScreenPath,
      name: RoutesName.profileScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const ProfileScreen()),
    ),
    GoRoute(
      path: RoutesPath.userInfoScreenPath,
      name: RoutesName.userInfoScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const UserInfoScreen()),
    ),
    GoRoute(
      path: RoutesPath.notificationsScreenPath,
      name: RoutesName.notificationsScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const NotificationsScreen()),
    ),
    GoRoute(
      path: RoutesPath.noNotificationScreenPath,
      name: RoutesName.noNotificationScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const NoNotificationScreen()),
    ),
    GoRoute(
      path: RoutesPath.enableNotificationScreenPath,
      name: RoutesName.enableNotificationScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const EnableNotificationScreen()),
    ),
    GoRoute(
      path: RoutesPath.notificationOptionsScreenPath,
      name: RoutesName.notificationOptionsScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const NotificationOptionsScreen()),
    ),
    GoRoute(
      path: RoutesPath.addressesScreenPath,
      name: RoutesName.addressesScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const AddressesScreen()),
    ),
    GoRoute(
      path: RoutesPath.ordersScreenPath,
      name: RoutesName.ordersScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const OrdersScreen()),
    ),
    GoRoute(
      path: RoutesPath.preferencesScreenPath,
      name: RoutesName.preferencesScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const PreferencesScreen()),
    ),
    GoRoute(
      path: RoutesPath.emptyWalletScreenPath,
      name: RoutesName.emptyWalletScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const EmptyWalletScreen()),
    ),
    GoRoute(
      path: RoutesPath.walletScreenPath,
      name: RoutesName.walletScreenRoute,
      pageBuilder: (context, state) =>
          _buildPage(const WalletScreen()),
    ),
     GoRoute(
      path: RoutesPath.itemPath,
      name: RoutesName.itemRoute,
      pageBuilder: (context, state) =>
          _buildPage( ItemListScreen()),
    ),
  ],
  errorPageBuilder: (context, state) =>
      _buildPage(const OnBordingScreen()),
);

Page _buildPage(Widget child) {
  return MaterialPage(child: child);
}
