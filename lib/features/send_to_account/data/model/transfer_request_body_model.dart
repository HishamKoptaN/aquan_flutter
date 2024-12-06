class TransferRequestBody {
  static final TransferRequestBody _instance = TransferRequestBody._();
  factory TransferRequestBody() {
    return _instance;
  }
  TransferRequestBody._();
  String? accountNumber;
  int? amount;

  Map<String, dynamic> toJson() => {
        'account_number': accountNumber,
        'amount': amount,
      };
}
