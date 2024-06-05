part of 'wallet_bloc.dart';

abstract class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletLoading extends WalletState {}

final class WalletError extends WalletState {
  final String message;

  WalletError({required this.message});
}

class WalletsDone extends WalletState {
  final List<Wallet> wallets;

  WalletsDone({required this.wallets});
}
