import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/Data/Provider.dart';

class ReviewScreen extends ConsumerWidget {
  final double totalAmount;

  ReviewScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    double shippingFee = totalAmount >= 2000 ? 0 : totalAmount * 0.075;
    double vat = totalAmount * 0.025;
    double finalTotal = totalAmount + vat + shippingFee;

    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController mobileController = TextEditingController();

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                buildTextField(context, nameController, "Full Name"),
                SizedBox(height: 12),
                buildTextField(context, mobileController, "Mobile Number"),
                SizedBox(height: 12),
                buildTextField(context, addressController, "Address"),
                SizedBox(height: 16),
                buildOrderReceipt(
                  cartItems,
                  context,
                ),
                SizedBox(height: 16),
                buildOrderSummary(
                    context, totalAmount, shippingFee, vat, finalTotal),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.grey[300]!
                                  : Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Payment Method",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.grey[800]!
                                    : Colors.white)),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF31B0D8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Continue",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildOrderReceipt(List<CartItem> cartItems, BuildContext context) {
    bool isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightMode ? Colors.white : Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode
              ? Colors.grey[300]!
              : Colors.transparent, // Light grey border in light mode
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Receipt",
            style: TextStyle(
              color: isLightMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: item.image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              color: isLightMode ? Colors.black : Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "PKR ${item.price}",
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Qty: ${item.quantity}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildOrderSummary(BuildContext context, double totalAmount,
      double shippingFee, double vat, double finalTotal) {
    bool isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightMode ? Colors.white : Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode
              ? Colors.grey[300]!
              : Colors.transparent, // Light grey border in light mode
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Summary",
              style: TextStyle(
                  color: isLightMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          buildSummaryRow(
              context,
              "Subtotal",
              "Rs ${totalAmount.toStringAsFixed(2)}",
              isLightMode ? Colors.black : Colors.white),
          buildSummaryRow(
              context,
              "Shipping Fee",
              totalAmount >= 2000
                  ? "Free"
                  : "Rs ${shippingFee.toStringAsFixed(2)}",
              totalAmount >= 2000
                  ? Colors.greenAccent
                  : isLightMode
                      ? Colors.grey
                      : Colors.white),
          buildSummaryRow(context, "Estimated VAT (2.5%)",
              "Rs ${vat.toStringAsFixed(2)}", Colors.orangeAccent),
          Divider(
              color: Colors
                  .grey[300]), // Adjusted for better visibility in light mode
          buildSummaryRow(
            context,
            "Total (Include of VAT)",
            "Rs ${finalTotal.toStringAsFixed(2)}",
            Color(0xFF31B0D8),
          ),
        ],
      ),
    );
  }

  Widget buildSummaryRow(BuildContext context, String title, String value,
      [Color? color]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white70)),
          Text(value,
              style: TextStyle(
                  color: color ?? Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildTextField(
      BuildContext context, TextEditingController controller, String hintText) {
    bool isLightMode = Theme.of(context).brightness == Brightness.light;

    return TextField(
      controller: controller,
      style: TextStyle(color: isLightMode ? Colors.black : Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(color: isLightMode ? Colors.grey : Colors.white70),
        filled: true,
        fillColor: isLightMode
            ? Colors.grey[100]
            : Colors.grey[850], // Light grey in light mode
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[850] ?? Colors.grey),
        ),
      ),
    );
  }
}
