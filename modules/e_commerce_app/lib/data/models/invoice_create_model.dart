import 'invoice_create_data.dart';

class InvoiceCreateModel {
  String? msg;
  List<InvoiceCreateData>? invoiceCreateData;

  InvoiceCreateModel({this.msg, this.invoiceCreateData});

  InvoiceCreateModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      invoiceCreateData = <InvoiceCreateData>[];
      json['data'].forEach((v) {
        invoiceCreateData!.add(new InvoiceCreateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.invoiceCreateData != null) {
      data['data'] = this.invoiceCreateData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


