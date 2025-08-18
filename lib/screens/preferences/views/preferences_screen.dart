import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:shop/Data/Provider.dart';
import 'package:shop/constants.dart';
import 'package:shop/main.dart';
import 'package:shop/route/screen_export.dart';

import 'components/prederence_list_tile.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cookie preferences"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Reset"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Column(
          children: [
            ListTile(
  onTap: () {
    ref.read(themeProvider.notifier).state =
        ref.read(themeProvider) == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
  },
  title: Text(
    "Theme Mode Dark",
    style: Theme.of(context).textTheme.titleSmall,
  ),
  subtitle: Padding(
    padding: const EdgeInsets.only(top: defaultPadding / 2),
    child: Text(
      "Tap on button to apply Dark mode",
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).textTheme.bodyMedium!.color),
    ),
  ),
  trailing: CupertinoSwitch(
    onChanged: (value) {
      ref.read(themeProvider.notifier).state =
          value ? ThemeMode.dark : ThemeMode.light; 
    },
    activeColor: primaryColor,
    value: ref.watch(themeProvider) == ThemeMode.dark, 
  ),
),
            PreferencesListTile(
              titleText: "Analytics",
              subtitleTxt:
                  "Analytics cookies help us improve our application by collecting and reporting info on how you use it. They collect information in a way that does not directly identify anyone.",
              isActive: true,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Personalization",
              subtitleTxt:
                  "Personalisation cookies collect information about your use of this app in order to display contect and experience that are relevant to you.",
              isActive: false,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Marketing",
              subtitleTxt:
                  "Maarketing cookies collec information about your use of this and other apps to enable display ads and other marketing that is more relevant to you.",
              isActive: false,
              press: () {},
            ),
            const Divider(height: defaultPadding * 2),
            PreferencesListTile(
              titleText: "Social media cookies",
              subtitleTxt:
                  "These cookies are set by a range of social media services that we have added to the site to enable you to share our content with your friends and networks.",
              isActive: false,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
