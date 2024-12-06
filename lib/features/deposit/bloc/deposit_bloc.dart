import 'dart:io';
import 'package:aquan/features/deposit/model/employee_account.dart';
import 'package:aquan/features/deposit/controller/deposit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/deposit_model.dart';
part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  final DepositController depositController = DepositController();

  DepositBloc() : super(DepositInitial()) {
    on<GetDeposits>(
      (event, emit) async {
        emit(DepositLoading());
        Map<String, dynamic> data = await depositController.getDeposits();
        GetDepositsApiResModel getDepositsApiResModel =
            GetDepositsApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            DepositsLoadedSuccessfully(
              deposits: getDepositsApiResModel.deposits,
            ),
          );
        } else {
          emit(DepositError(message: data['error']));
        }
      },
    );

    on<GetDepositPaymentMethods>(
      (event, emit) async {
        emit(DepositLoading());
        Map<String, dynamic> data = await depositController.getPaymentMethods();
        GetEmployeeAccountApiResModel getEmployeeAccountApiResModel =
            GetEmployeeAccountApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            DepositPaymentMethodsDone(
              getEmployeeAccountApiResModel: getEmployeeAccountApiResModel,
            ),
          );
        } else {
          emit(DepositError(message: data['error']));
        }
      },
    );

    on<CreateDeposit>(
      (event, emit) async {
        emit(DepositLoading());
        Map<String, dynamic> data = await depositController.depositMoney(
          file: event.file,
          amount: event.amount,
          method: event.method,
          employeeId: event.employeeId,
        );
        if (data['status']) {
          emit(
            DepositCreatedSuccessfully(),
          );
        } else if (!data['status']) {
          emit(
            DepositError(
              message: data['error'],
            ),
          );
        }
      },
    );
  }
}
