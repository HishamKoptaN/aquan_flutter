import 'dart:io';

class ChangePlanRequestBodyModel {
  static final ChangePlanRequestBodyModel _instance =
      ChangePlanRequestBodyModel._();
  factory ChangePlanRequestBodyModel() {
    return _instance;
  }
  ChangePlanRequestBodyModel._();
  int? planInvoiceId;
  int? method;
  int? amount;
  File? imageFile;

  Map<String, dynamic> toJson() => {
        'plan_invoice_id': planInvoiceId,
        'method': method,
        'amount': amount,
      };
}
