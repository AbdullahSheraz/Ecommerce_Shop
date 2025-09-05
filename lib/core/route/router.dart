
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/data/services/auth_local_storage_services.dart';
import 'package:shop/entry_point.dart';
import 'package:shop/presentation/screens/home/views/components/brands/brandsGridView.dart';
import 'package:shop/presentation/screens/home/views/components/categories/gridViewCategories.dart';
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
      pageBuilder: (context, state) => _buildPage(const RegisterScreen()),
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
