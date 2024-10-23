import 'package:e_commers_app/data/models/payment_method_model.dart';

class InvoiceCreateData {
  List<PaymentMethod>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  InvoiceCreateData({this.paymentMethod, this.payable, this.vat, this.total});

  InvoiceCreateData.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(PaymentMethod.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.paymentMethod != null) {
      data['paymentMethod'] =
          this.paymentMethod!.map((v) => v.toJson()).toList();
    }
    data['payable'] = this.payable;
    data['vat'] = this.vat;
    data['total'] = this.total;
    return data;
  }
}