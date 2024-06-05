import 'dart:io';

import 'package:aquan/Controllers/home_controller.dart';
import 'package:aquan/Controllers/plan_controller.dart';
import 'package:aquan/Models/currency.dart';
import 'package:aquan/Models/plan.dart';
import 'package:aquan/Models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final PlanController _controller = PlanController();
  final HomeController _homeController = HomeController();

  PlanBloc() : super(PlanInitial()) {
    on<GetPlans>((event, emit) async {
      Map<String, dynamic> data = await _controller.getPlans();

      if (data['status']) {
        emit(PlansDone(plans: data['plans'], user: data['user']));
      } else {
        emit(PlanError(message: data['message']));
      }
    });

    on<GetPaymentMethods>((event, emit) async {
      Map<String, dynamic> data = await _homeController.planPaymentMethods();

      if (data['status']) {
        List<dynamic> currs = data['content'];
        List<Currency> methods =
            currs.map((c) => Currency.fromJson(c)).toList();
        emit(PaymentMethodsDone(methods: methods));
      } else {
        emit(PlanError(message: data['message']));
      }
    });

    on<PayPlan>((event, emit) async {
      Map<String, dynamic> data = await _controller.payPlan(
        event.plan.id!,
        event.image,
      );

      if (data['status']) {
        emit(PaymentDone(message: data['message']));
      } else {
        emit(PlanError(message: data['message']));
      }
    });
  }
}
