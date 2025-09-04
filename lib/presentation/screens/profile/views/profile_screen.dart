import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/core/constants/route_constants.dart';
import 'package:shop/presentation/screens/profile/views/components/profile_shimmer.dart';
import 'package:shop/providers/auth_providers.dart';
import 'package:shop/providers/auth_state.dart';
import 'package:shop/data/services/auth_local_storage_services.dart';

import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userProfileProvider);
    final auth = AuthLocalStorage.getToken();
    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          ref.refresh(userProfileProvider);
        },
        child: ListView(
          children: [
            userAsync.when(
              skipLoadingOnRefresh: false,
              data: (user) => Column(
                children: [
                  ProfileCard(
                    name: user.name,
                    email: user.email,
                    imageSrc: user.imageUrl ?? "assets/images/default.png",
                    press: () {
                      //  context.pushNamed(RoutesName.userInfoScreenRoute);
                    },
                  ),
                ],
              ),
              loading: () => const ProfileCardShimmer(),
              error: (e, _) => Center(child: Text("Error: $e")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "Account",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            gapH8,
            ProfileMenuListTile(
              text: "Orders",
              svgSrc: "assets/icons/Order.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Returns",
              svgSrc: "assets/icons/Return.svg",
              press: () {},
            ),
            ProfileMenuListTile(
              text: "Wishlist",
              svgSrc: "assets/icons/Wishlist.svg",
              press: () {},
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Personalization",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              svgSrc: "assets/icons/Notification.svg",
              text: "Notification",
              press: () {
                context.pushNamed(RoutesName.enableNotificationScreenRoute);
              },
            ),
            ProfileMenuListTile(
              text: "Preferences",
              svgSrc: "assets/icons/Preferences.svg",
              press: () {
                context.pushNamed(RoutesName.preferencesScreenRoute);
              },
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Help & Support",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: "FAQ",
              svgSrc: "assets/icons/FAQ.svg",
              press: () {},
            ),
            ListTile(
              onTap: () async {
                await AuthLocalStorage.logout();
                ref.read(authProvider.notifier).logout();
                context.go(RoutesPath.logInScreenPath);
              },
              minLeadingWidth: 24,
              leading: SvgPicture.asset(
                "assets/icons/Logout.svg",
                height: 24,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  errorColor,
                  BlendMode.srcIn,
                ),
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(color: errorColor, fontSize: 14, height: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
