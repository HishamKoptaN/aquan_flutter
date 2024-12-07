import 'dart:io';
import 'package:aquan/features/deposit/model/employee_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/deposit_model.dart';
part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc() : super(DepositInitial()) {
    on<GetDeposits>(
      (event, emit) async {
        emit(DepositLoading());
      },
    );

    on<GetDepositPaymentMethods>(
      (event, emit) async {
        emit(DepositLoading());
      },
    );

    on<CreateDeposit>(
      (event, emit) async {
        emit(DepositLoading());
      },
    );
  }
}
