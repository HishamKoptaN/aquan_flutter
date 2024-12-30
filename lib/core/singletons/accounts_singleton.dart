import '../models/account.dart';

class AccountsSingleton {
  // Private variable to store accounts
  List<Account>? _accounts;

  // Private constructor
  AccountsSingleton._();

  // Singleton instance
  static final AccountsSingleton _instance = AccountsSingleton._();

  // Getter for the singleton instance
  static AccountsSingleton get instance => _instance;

  // Getter to access accounts
  List<Account>? get accounts => _accounts;

  // Load accounts into the singleton
  void load(List<Account> accounts) {
    _accounts = accounts;
  }

  // Setter to update accounts (optional, based on use case)
  set accounts(List<Account>? accounts) {
    _accounts = accounts;
  }

  bool updateAccount({
    required int id,
    required String accountNumber,
  }) {
    if (_accounts == null) return false; // No accounts loaded
    // Find the account with the given id
    final index = _accounts!.indexWhere((account) => account.id == id);
    if (index != -1) {
      _accounts![index] =
          _accounts![index].copyWith(accountNumber: accountNumber);
      return true; // Update succeeded
    }
    return false; // Account not found
  }

  // Clear accounts data
  void clear() {
    _accounts = null;
  }

  // Check if accounts are loaded
  bool get isLoaded => _accounts != null && _accounts!.isNotEmpty;
}
