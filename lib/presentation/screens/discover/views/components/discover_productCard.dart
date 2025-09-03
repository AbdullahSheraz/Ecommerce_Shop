import 'package:flutter/material.dart';
import 'package:shop/presentation/components/network_image_with_loader.dart';
import 'package:shop/core/constants/constants.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/models/product_model.dart';

class ProductCard21 extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onPress;

  const ProductCard21({super.key, required this.product, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double cardWidth = screenWidth * 0.4; 
    double cardHeight = screenHeight * 0.3;

    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(cardWidth, cardHeight),
        maximumSize: Size(cardWidth, cardHeight),
        padding: EdgeInsets.all(screenWidth * 0.02),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                NetworkImageWithLoader(product.image, radius: defaultBorderRadious),
                if (product.dicountpercent != null)
                  Positioned(
                    right: screenWidth * 0.02,
                    top: screenWidth * 0.02,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      height: screenHeight * 0.02,
                      decoration: const BoxDecoration(
                        color: errorColor,
                        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
                      ),
                      child: Center(
                        child: Text(
                          "${product.dicountpercent}% off",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        gapH4,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenWidth * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brandName.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: screenWidth * 0.025),
                  ),
                  gapH4,
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: screenWidth * 0.03),
                  ),
                 gapH4,
                  product.priceAfetDiscount != null
                      ? Row(
                          children: [
                            Text(
                              "Rs${product.priceAfetDiscount}",
                              style: TextStyle(
                                color: const Color(0xFF31B0D8),
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                      gapW4,
                            Text(
                              "Rs:${product.price}",
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                                fontSize: screenWidth * 0.025,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "Rs${product.price}",
                          style: TextStyle(
                            color: const Color(0xFF31B0D8),
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                  const Spacer(), 
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF31B0D8),
                    ),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
