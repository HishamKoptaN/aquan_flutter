import 'package:aquan/app/wallet/controller/wallet_controller.dart';
import 'package:aquan/app/wallet/model/wallet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletController _controller = WalletController();

  WalletBloc() : super(WalletInitial()) {
    on<GetWallets>((event, emit) async {
      emit(WalletLoading());

      Map<String, dynamic> data = await _controller.getWallets();

      if (data['status']) {
        List walletList = data['wallets'];
        List<Wallet> wallets = walletList
            .map(
              (wallet) => Wallet.fromJson(wallet),
            )
            .toList();
        emit(WalletsDone(wallets: wallets));
      } else {
        emit(WalletError(message: data['error']));
      }
    });
  }
}
