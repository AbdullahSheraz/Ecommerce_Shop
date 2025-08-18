import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shop/components/list_tile/divider_list_tile.dart';
import 'package:shop/components/network_image_with_loader.dart';
import 'package:shop/constants.dart';
import 'package:shop/constants/app_sizes.dart';

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
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 3));
          setState(() {});
        },
        child: ListView(
          children: [
            ProfileCard(
              name: "Sepide",
              email: "theflutterway@gmail.com",
              imageSrc: "https://i.imgur.com/IXnwbLk.png",
              // proLableText: "Sliver",
              // isPro: true, if the user is pro
              press: () {
                context.goNamed('userInfo');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding * 1.5),
              child: GestureDetector(
                onTap: () {},
                child: const AspectRatio(
                  aspectRatio: 1.8,
                  child:
                      NetworkImageWithLoader("https://i.imgur.com/dz0BBom.png"),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "Account",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
           gapH8,           ProfileMenuListTile(
              text: "Orders",
              svgSrc: "assets/icons/Order.svg",
              press: () {
                context.goNamed('orders');
              },
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
            ProfileMenuListTile(
              text: "Addresses",
              svgSrc: "assets/icons/Address.svg",
              press: () {
                context.goNamed('addresses');
              },
            ),
            ProfileMenuListTile(
              text: "Payment",
              svgSrc: "assets/icons/card.svg",
              press: () {
                context.goNamed('emptyPayment');
              },
            ),
            ProfileMenuListTile(
              text: "Wallet",
              svgSrc: "assets/icons/Wallet.svg",
              press: () {
                context.goNamed('wallet');
              },
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
            DividerListTileWithTrilingText(
              svgSrc: "assets/icons/Notification.svg",
              title: "Notification",
              trilingText: "Off",
              press: () {
                context.goNamed('enableNotification');
              },
            ),
            ProfileMenuListTile(
              text: "Preferences",
              svgSrc: "assets/icons/Preferences.svg",
              press: () {
                context.goNamed('preferences');
              },
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: "Language",
              svgSrc: "assets/icons/Language.svg",
              press: () {
                context.goNamed('selectLanguage');
              },
            ),
            ProfileMenuListTile(
              text: "Location",
              svgSrc: "assets/icons/Location.svg",
              press: () {},
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
              text: "Get Help",
              svgSrc: "assets/icons/Help.svg",
              press: () {
                context.goNamed('getHelp');
              },
            ),
            ProfileMenuListTile(
              text: "FAQ",
              svgSrc: "assets/icons/FAQ.svg",
              press: () {},
              isShowDivider: false,
            ),
            ProfileMenuListTile(
              text: "Crashlytics Firebase",
              svgSrc: "assets/icons/FAQ.svg",
              press: () {
                FirebaseCrashlytics.instance.crash();
              },
              isShowDivider: false,
            ),
gapH16,
            

            
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
