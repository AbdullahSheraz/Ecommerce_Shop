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
import 'package:shop/data/services/auth_local_storage_services.dart';
import 'package:shop/entry_point.dart';
import 'package:shop/presentation/screens/home/views/components/brandsGridView.dart';
import 'package:shop/presentation/screens/home/views/components/gridViewCategories.dart';
import 'screen_export.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesPath.logInScreenPath,
  redirect: (context, state) async {
  final loggedIn = await AuthLocalStorage.isLoggedIn();

  final publicRoutes = [
    RoutesPath.logInScreenPath,
    RoutesPath.signUpScreenPath,
    RoutesPath.passwordRecoveryScreenPath,
  ];

  final goingPublic = publicRoutes.contains(state.matchedLocation);

  if (!loggedIn && !goingPublic) {
     return RoutesPath.logInScreenPath;
  } else if (loggedIn && goingPublic) {
 
    return '/dum';
  }

  return null; 

  },
  routes: [
    GoRoute(
      path: RoutesPath.onbordingScreenPath,
      name: RoutesName.onbordingScreenRoute,
      pageBuilder: (context, state) => _buildPage(const OnBordingScreen()),
    ),
    GoRoute(
      path: RoutesPath.logInScreenPath,
      name: RoutesName.logInScreenRoute,
      pageBuilder: (context, state) => _buildPage(const LoginScreen()),
    ),
    GoRoute(
      path: RoutesPath.signUpScreenPath,
      name: RoutesName.signUpScreenRoute,
      pageBuilder: (context, state) => _buildPage(const SignUpScreen()),
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
          _buildPage(const EntryPoint(initialIndex: 1)),
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

    GoRoute(
      path: '/dum',
      name: 'dum',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 0)),
    ),
    GoRoute(
      path: '/dummy',
      name: 'dummy',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 1, text: 'All')),
    ),
    GoRoute(
      path: '/dummy0',
      name: 'dummy0',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 1, text: 'Tiles')),
    ),
    GoRoute(
      path: '/dummy1',
      name: 'dummy1',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 1, text: "Floor Tiles")),
    ),
    GoRoute(
      path: '/dummy2',
      name: 'dummy2',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 1, text: "Bathroom Tiles")),
    ),
    GoRoute(
      path: '/dummy3',
      name: 'dummy3',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 1, text: "Imported Tiles")),
    ),
    GoRoute(
      path: '/dummy4',
      name: 'dummy4',
      pageBuilder: (context, state) =>
          _buildPage(const EntryPoint(initialIndex: 1, text: "Sanitary Ware")),
    ),

    GoRoute(
      path: RoutesPath.homeScreenPath,
      name: RoutesName.homeScreenRoute,
      pageBuilder: (context, state) => _buildPage(const HomeScreen()),
    ),
    GoRoute(
      path: RoutesPath.discoverScreenPath,
      name: RoutesName.discoverScreenRoute,
      pageBuilder: (context, state) => _buildPage(const DiscoverScreen()),
    ),

    GoRoute(
      path: RoutesPath.bookmarkScreenPath,
      name: RoutesName.bookmarkScreenRoute,
      pageBuilder: (context, state) => _buildPage(const BookmarkScreen()),
    ),
    GoRoute(
      path: RoutesPath.profileScreenPath,
      name: RoutesName.profileScreenRoute,
      pageBuilder: (context, state) => _buildPage(const ProfileScreen()),
    ),

    GoRoute(
      path: RoutesPath.preferencesScreenPath,
      name: RoutesName.preferencesScreenRoute,
      pageBuilder: (context, state) => _buildPage(const PreferencesScreen()),
    ),
    GoRoute(
      path: RoutesPath.categoryGridPath,
      name: RoutesName.categoryGridRoute,
      pageBuilder: (context, state) => _buildPage(const CategoriesGrid()),
    ),
    GoRoute(
      path: RoutesPath.brandGridPath,
      name: RoutesName.brandGridRoute,
      pageBuilder: (context, state) => _buildPage(const BrandsGrid()),
    ),
  ],
  errorPageBuilder: (context, state) => _buildPage(const OnBordingScreen()),
);

Page _buildPage(Widget child) => MaterialPage(child: child);
