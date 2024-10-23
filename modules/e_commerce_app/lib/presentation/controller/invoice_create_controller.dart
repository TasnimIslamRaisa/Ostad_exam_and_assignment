import 'package:e_commers_app/data/models/network_response.dart';
import 'package:e_commers_app/data/models/payment_method_model.dart';
import 'package:e_commers_app/data/services/network_caller.dart';
import 'package:e_commers_app/data/utils/urls.dart';
import 'package:get/get.dart';
import '../../data/models/invoice_create_model.dart';

class InvoiceCreateController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage = '';
  String? get errorMessage => _errorMessage;

  List<PaymentMethod> _cardPaymentMethod = [];
  List<PaymentMethod> _mobilePaymentMethod = [];
  List<PaymentMethod> _internetPaymentMethod = [];

  List<PaymentMethod> get cardPaymentMethod => _cardPaymentMethod;
  List<PaymentMethod> get mobilePaymentMethod => _mobilePaymentMethod;
  List<PaymentMethod> get internetPaymentMethod => _internetPaymentMethod;

  Future<bool> getPaymentMethod() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(url: Urls.invoiceCreate);

    if (response.isSuccess && response.responseData["msg"] == "success") {
      InvoiceCreateModel invoiceCreate =
      InvoiceCreateModel.fromJson(response.responseData);

      if (invoiceCreate.invoiceCreateData != null && invoiceCreate.invoiceCreateData!.isNotEmpty) {
        for (var payment in invoiceCreate.invoiceCreateData!.first.paymentMethod ?? []) {
          /*data is a list containing one Data object.
          Using first retrieves that first Data object, which includes the paymentMethod list.
          So invoiceCreate.data!.first.paymentMethod accesses the paymentMethod list within the first Data object.*/
          switch (payment.type) {
            case 'othercards':
              _cardPaymentMethod.add(payment);
              break;
            case 'mobilebanking':
              _mobilePaymentMethod.add(payment);
              break;
            case 'internetbanking':
              _internetPaymentMethod.add(payment);
              break;
            default:
              if (payment.type == "amex" ||
                  payment.type == "visa" ||
                  payment.type == "master") {
                _cardPaymentMethod.add(payment);
              }
              break;
          }
        }
        isSuccess = true;
      }
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}