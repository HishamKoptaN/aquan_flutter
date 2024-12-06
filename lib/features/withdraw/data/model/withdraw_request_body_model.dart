class WithdrawRequestBody {
  static final WithdrawRequestBody _instance = WithdrawRequestBody._();
  factory WithdrawRequestBody() {
    return _instance;
  }
  WithdrawRequestBody._();
  String? amount;
  String? method;
  String? reveivingAccountNumber;

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'method': method,
        'reveiving_account_number': reveivingAccountNumber,
      };
}
