import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shop/Data/Provider.dart';

Future<void> sendOrderEmail({
  required String recipientEmail,
  required String userName,
  required List<CartItem> cartItems,
  required double totalAmount,
  required double shippingFee,
  required double vat,
  required double finalTotal,
}) async {
  final smtpServer = gmail("yourEmail@gmail.com", "yourAppPassword");

  String cartDetails = cartItems.map((item) =>
      "${item.title} (Qty: ${item.quantity}) - PKR ${item.price}").join("\n");

  final message = Message()
    ..from = Address("yourEmail@gmail.com", "Shop App")
    ..recipients.add(recipientEmail)
    ..subject = "Order Receipt - $userName"
    ..text = """
Hello $userName,  

Here is your order receipt:  

$cartDetails  

Subtotal: Rs ${totalAmount.toStringAsFixed(2)}  
Shipping Fee: ${shippingFee == 0 ? "Free" : "Rs ${shippingFee.toStringAsFixed(2)}"}  
VAT (2.5%): Rs ${vat.toStringAsFixed(2)}  

Total (Incl. VAT): Rs ${finalTotal.toStringAsFixed(2)}  

Thank you for shopping with us!
""";

  try {
    final sendReport = await send(message, smtpServer);
    print('Email sent: ' + sendReport.toString());
  } catch (e) {
    print('Error sending email: $e');
  }
}
