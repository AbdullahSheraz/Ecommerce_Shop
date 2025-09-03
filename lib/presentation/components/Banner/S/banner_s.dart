import 'package:flutter/material.dart';
import 'package:shop/core/constants/constants.dart';


class BannerS extends StatelessWidget {
  const BannerS(
      {super.key,
      required this.image,
      required this.press,
      required this.children});

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: AspectRatio(
        aspectRatio: 2.56,
        child: GestureDetector(
          onTap: press,
          child: Stack(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(image,
                      fit: BoxFit.contain, width: double.infinity),
                ),
              ),
              Container(color: Colors.grey.withValues(alpha: 0.07)),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
