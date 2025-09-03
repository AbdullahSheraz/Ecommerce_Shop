import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/core/constants/route_constants.dart';

import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          setState(() {});
        },
        child: ListView(
          children: [
            ProfileCard(
              name: "Ahmad",
              email: "itsTechWorld@gmail.com",
              imageSrc: 'assets/images/its.jpg',
              press: () {
                context.pushNamed(RoutesName.userInfoScreenRoute);
              },
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
              onTap: () {},
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
