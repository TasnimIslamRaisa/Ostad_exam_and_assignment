import 'package:e_commers_app/presentation/controller/invoice_create_controller.dart';
import 'package:e_commers_app/presentation/ui/screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetBankingPayment extends StatelessWidget {
  const InternetBankingPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceCreateController>(
        builder: (invoiceCreationController) {
          // Handle error message display
          if (invoiceCreationController.errorMessage != null &&
              invoiceCreationController.errorMessage!.isNotEmpty) {
            return Center(
              child: Text(
                invoiceCreationController.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return Visibility(
            visible: !invoiceCreationController.inProgress,
            replacement: CircularProgressIndicator(),
            child: Card(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Adjust columns based on design
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: invoiceCreationController.internetPaymentMethod.length,
                itemBuilder: (context, index) {
                  // Show actual content from the PaymentMethod
                  final paymentMethod =
                  invoiceCreationController.internetPaymentMethod[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => WebViewScreen(
                          link: paymentMethod.redirectGatewayURL.toString()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Image.network(paymentMethod.logo ?? ""),
                          ) // Show payment method name
                          // You can display other details or icons here if needed
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}