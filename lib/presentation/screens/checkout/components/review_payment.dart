// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop/Data/Provider.dart';
// import 'package:shop/screens/checkout/components/EmailSend.dart';

// class ReviewScreen extends ConsumerWidget {
//   final double totalAmount;

//   ReviewScreen({super.key, required this.totalAmount});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cartItems = ref.watch(cartProvider);
//     double shippingFee = totalAmount >= 2000 ? 0 : totalAmount * 0.075;
//     double vat = totalAmount * 0.025;
//     double finalTotal = totalAmount + vat + shippingFee;

//     TextEditingController nameController = TextEditingController();
//     TextEditingController emailController = TextEditingController();
//     TextEditingController mobileController = TextEditingController();

//     return DraggableScrollableSheet(
//       initialChildSize: 0.8,
//       minChildSize: 0.6,
//       maxChildSize: 0.95,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).brightness == Brightness.light
//                 ? Colors.white
//                 : Colors.black,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           padding: EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             controller: scrollController,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 50,
//                     height: 5,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).brightness == Brightness.light
//                           ? Colors.black
//                           : Colors.white38,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 buildTextField(context, nameController, "Full Name"),
//                 SizedBox(height: 12),
//                 buildTextField(context, mobileController, "Mobile Number"),
//                 SizedBox(height: 12),
//                 buildTextField(context, emailController, "Email"),
//                 SizedBox(height: 16),
//                 buildOrderReceipt(
//                   cartItems,
//                   context,
//                 ),
//                 SizedBox(height: 16),
//                 buildOrderSummary(
//                     context, totalAmount, shippingFee, vat, finalTotal),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () {},
//                         style: OutlinedButton.styleFrom(
//                           side: BorderSide(
//                               color: Theme.of(context).brightness ==
//                                       Brightness.light
//                                   ? Colors.grey[300]!
//                                   : Colors.white),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text("Payment Method",
//                             style: TextStyle(
//                                 color: Theme.of(context).brightness ==
//                                         Brightness.light
//                                     ? Colors.grey[800]!
//                                     : Colors.white)),
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           final userName = nameController.text.trim();
//                           final userEmail = emailController.text.trim();

//                           if (userName.isEmpty || userEmail.isEmpty) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                   content: Text(
//                                       "Please fill in your name and email")),
//                             );
//                             return;
//                           }

//                           await sendOrderEmail(
//                             recipientEmail: userEmail,
//                             userName: userName,
//                             cartItems: cartItems,
//                             totalAmount: totalAmount,
//                             shippingFee: shippingFee,
//                             vat: vat,
//                             finalTotal: finalTotal,
//                           );

//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                                 content: Text("Receipt sent to $userEmail")),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blueGrey.shade900,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text("Continue",
//                             style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget buildOrderReceipt(List<CartItem> cartItems, BuildContext context) {
//     bool isLightMode = Theme.of(context).brightness == Brightness.light;

//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: isLightMode ? Colors.white : Colors.grey[900],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: isLightMode
//               ? Colors.grey[300]!
//               : Colors.transparent, // Light grey border in light mode
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Order Receipt",
//             style: TextStyle(
//               color: isLightMode ? Colors.black : Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: cartItems.length,
//             itemBuilder: (context, index) {
//               final item = cartItems[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: CachedNetworkImage(
//                         imageUrl: item.image,
//                         height: 40,
//                         width: 40,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             item.title,
//                             style: TextStyle(
//                               color: isLightMode ? Colors.black : Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                           Text(
//                             "PKR ${item.price}",
//                             style: const TextStyle(
//                               color: Colors.orange,
//                               fontSize: 10,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       "Qty: ${item.quantity}",
//                       style: const TextStyle(
//                         color: Colors.orange,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildOrderSummary(BuildContext context, double totalAmount,
//       double shippingFee, double vat, double finalTotal) {
//     bool isLightMode = Theme.of(context).brightness == Brightness.light;

//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: isLightMode ? Colors.white : Colors.grey[900],
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: isLightMode
//               ? Colors.grey[300]!
//               : Colors.transparent, // Light grey border in light mode
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Order Summary",
//               style: TextStyle(
//                   color: isLightMode ? Colors.black : Colors.white,
//                   fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           buildSummaryRow(
//               context,
//               "Subtotal",
//               "Rs ${totalAmount.toStringAsFixed(2)}",
//               isLightMode ? Colors.black : Colors.white),
//           buildSummaryRow(
//               context,
//               "Shipping Fee",
//               totalAmount >= 2000
//                   ? "Free"
//                   : "Rs ${shippingFee.toStringAsFixed(2)}",
//               totalAmount >= 2000
//                   ? Colors.greenAccent
//                   : isLightMode
//                       ? Colors.grey
//                       : Colors.white),
//           buildSummaryRow(context, "Estimated VAT (2.5%)",
//               "Rs ${vat.toStringAsFixed(2)}", Colors.orangeAccent),
//           Divider(
//               color: Colors
//                   .grey[300]), // Adjusted for better visibility in light mode
//           buildSummaryRow(
//             context,
//             "Total (Include of VAT)",
//             "Rs ${finalTotal.toStringAsFixed(2)}",
//             Color(0xFF31B0D8),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildSummaryRow(BuildContext context, String title, String value,
//       [Color? color]) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title,
//               style: TextStyle(
//                   color: Theme.of(context).brightness == Brightness.light
//                       ? Colors.black
//                       : Colors.white70)),
//           Text(value,
//               style: TextStyle(
//                   color: color ?? Colors.white, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }

//   Widget buildTextField(
//       BuildContext context, TextEditingController controller, String hintText) {
//     bool isLightMode = Theme.of(context).brightness == Brightness.light;

//     return TextField(
//       controller: controller,
//       style: TextStyle(color: isLightMode ? Colors.black : Colors.white),
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(color: isLightMode ? Colors.grey : Colors.white70),
//         filled: true,
//         fillColor: isLightMode
//             ? Colors.grey[100]
//             : Colors.grey[850], // Light grey in light mode
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: Colors.grey[850] ?? Colors.grey),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shop/core/constants/app_sizes.dart';
import 'package:shop/models/cartItem_model.dart';
import 'package:shop/providers/cart_item_provider.dart';

class ReviewScreen extends ConsumerStatefulWidget {
  final double totalAmount;
  const ReviewScreen({super.key, required this.totalAmount});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();

    nameController.addListener(validateForm);
    emailController.addListener(validateForm);
    mobileController.addListener(validateForm);
  }

  void validateForm() {
    final valid = nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        mobileController.text.trim().isNotEmpty;

    if (valid != isFormValid) {
      setState(() => isFormValid = valid);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);

    double shippingFee =
        widget.totalAmount >= 2000 ? 0 : widget.totalAmount * 0.075;
    double vat = widget.totalAmount * 0.025;
    double finalTotal = widget.totalAmount + vat + shippingFee;

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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(16),
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
                gapH16,
                buildTextField(context, nameController, "Full Name"),
                gapH12,
                buildTextField(context, mobileController, "Mobile Number"),
                gapH12,
                buildTextField(context, emailController, "Email"),
                gapH16,
                buildOrderReceipt(cartItems, context),
                gapH16,
                buildOrderSummary(
                    context, widget.totalAmount, shippingFee, vat, finalTotal),
                gapH20,
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
                    gapW12,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: isFormValid
                            ? () async {
                                String cartSummary = cartItems
                                    .map((item) =>
                                        '${item.brandName} x${item.quantity} - Rs.${item.price * item.quantity}')
                                    .join("\n");

                                String body = '''
Hello ${nameController.text},

Thank you for your order. Here are your details:

Name: ${nameController.text}
Email: ${emailController.text}
Mobile: ${mobileController.text}

Cart Items:
$cartSummary

Final Total: Rs.$finalTotal

Best regards,
Your Shop App
''';

                                await sendCustomEmail(
                                  recipientEmail: emailController.text,
                                  subject: "Order Summary",
                                  body: body,
                                );
                                context.pop(context);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFormValid
                              ? const Color(0xFF1976D2)
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        ),
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

  Future<void> sendCustomEmail({
    required String recipientEmail,
    required String subject,
    required String body,
  }) async {
    final cartItems = ref.read(cartProvider);
    double shippingFee =
        widget.totalAmount >= 2000 ? 0 : widget.totalAmount * 0.075;
    double vat = widget.totalAmount * 0.025;
    double finalTotal = widget.totalAmount + vat + shippingFee;

    String cartTable = """
  <table border="1" cellpadding="8" cellspacing="0" width="100%" style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px;">
    <thead style="background-color: #f4f4f4;">
      <tr>
        <th align="left">Product</th>
        <th align="center">Qty</th>
        <th align="right">Price</th>
        <th align="right">Total</th>
      </tr>
    </thead>
    <tbody>
  """;

    for (var item in cartItems) {
      double price = double.tryParse(item.price) ?? 0.0;
      double itemTotal = price * item.quantity;

      cartTable += """
    <tr>
      <td>${item.title}</td>
      <td align="center">${item.quantity}</td>
      <td align="right">Rs. ${price.toStringAsFixed(2)}</td>
      <td align="right">Rs. ${itemTotal.toStringAsFixed(2)}</td>
    </tr>
  """;
    }

    cartTable += """
    </tbody>
  </table>
  """;

    String htmlBody = """
  <html>
  <body style="font-family: Arial, sans-serif; color: #333;">
    <h2>Thank you for your order, ${nameController.text}!</h2>
    <p>Here are your order details:</p>

    $cartTable

    <br>
    <h3>Order Summary</h3>
    <table cellpadding="5" cellspacing="0" width="100%" style="font-family: Arial, sans-serif; font-size: 14px;">
      <tr>
        <td>Subtotal:</td>
        <td align="right">Rs. ${widget.totalAmount.toStringAsFixed(2)}</td>
      </tr>
      <tr>
        <td>Shipping Fee:</td>
        <td align="right">${widget.totalAmount >= 2000 ? "Free" : "Rs. ${shippingFee.toStringAsFixed(2)}"}</td>
      </tr>
      <tr>
        <td>Estimated VAT (2.5%):</td>
        <td align="right">Rs. ${vat.toStringAsFixed(2)}</td>
      </tr>
      <tr style="font-weight: bold; color: #1976D2;">
        <td>Total (Incl. VAT):</td>
        <td align="right">Rs. ${finalTotal.toStringAsFixed(2)}</td>
      </tr>
    </table>

    <br>
    <p style="margin-top:20px;">We’ll notify you when your order ships 🚚</p>
    <p>Best regards,<br>CityShop</p>
  </body>
  </html>
  """;

    final smtpServer = SmtpServer(
      'mail.top10s.pk',
      port: 465,
      ssl: true,
      username: 'tampo@top10s.pk',
      password: 'cAAa!A+Q8aD+',
    );

    final message = Message()
      ..from = const Address('tampo@top10s.pk', 'Demo Shop Support')
      ..recipients.add(recipientEmail)
      ..subject = subject
      ..html = htmlBody;

    try {
      await send(message, smtpServer);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Order Sent")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error Occured")),
      );
    }
  }

  Widget buildOrderReceipt(List<CartItem> cartItems, BuildContext context) {
    bool isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightMode ? Colors.white : Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode ? Colors.grey[300]! : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Receipt",
              style: TextStyle(
                  color: isLightMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold)),
          gapH8,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                    gapW12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: TextStyle(
                                color:
                                    isLightMode ? Colors.black : Colors.white,
                                fontSize: 12,
                              )),
                          Text("PKR ${item.price}",
                              style: const TextStyle(
                                  color: Colors.orange, fontSize: 10)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text("Qty: ${item.quantity}",
                        style: const TextStyle(
                            color: Colors.orange, fontSize: 10)),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightMode ? Colors.white : Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode ? Colors.grey[300]! : Colors.transparent,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Summary",
              style: TextStyle(
                  color: isLightMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold)),
          gapH8,
          buildSummaryRow(
              context, "Subtotal", "Rs ${totalAmount.toStringAsFixed(2)}"),
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
          Divider(color: Colors.grey[300]),
          buildSummaryRow(context, "Total (Include of VAT)",
              "Rs ${finalTotal.toStringAsFixed(2)}", const Color(0xFF31B0D8)),
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
        hintStyle: TextStyle(color: isLightMode ? Colors.grey : Colors.white70),
        filled: true,
        fillColor: isLightMode ? Colors.grey[100] : Colors.grey[850],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
