
import 'package:flutter/material.dart';
import 'package:shop/constants.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.category, required this.isActive, required this.press});

  final String category;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF31B0D8) : Colors.transparent,
          border: Border.all(color: isActive ? Colors.transparent : Theme.of(context).brightness == Brightness.light
                ?Colors.grey.withOpacity(0.2): Theme.of(context).dividerColor
                ),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ), 
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
      ),
    );
  }
}