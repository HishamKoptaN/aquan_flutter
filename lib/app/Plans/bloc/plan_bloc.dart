import 'dart:io';
import 'package:aquan/app/home_page/controller/home_controller.dart';
import 'package:aquan/app/Plans/controller/plan_controller.dart';
import 'package:aquan/app/currency/model/currency.dart';
import 'package:aquan/app/Plans/model/plan.dart';
import 'package:aquan/app/Auth/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final PlanController _controller = PlanController();
  final HomeController _homeController = HomeController();
  bool isAccept = false;

  PlanBloc() : super(PlanInitial()) {
    on<GetPlans>((event, emit) async {
      emit(PlanLoading());
      try {
        Map<String, dynamic> data = await _controller.getPlans();
        if (data['status']) {
          emit(PlansDone(plans: data['plans'], user: data['user']));
        } else {
          emit(PlanError(message: data['message']));
        }
      } catch (error) {
        emit(PlanError(message: error.toString()));
      }
    });

    on<GetPaymentMethods>((event, emit) async {
      emit(PlanLoading());
      try {
        Map<String, dynamic> data = await _homeController.planPaymentMethods();
        if (data['status']) {
          List<dynamic> currs = data['content'];
          List<Currency> methods =
              currs.map((c) => Currency.fromJson(c)).toList();
          emit(PaymentMethodsDone(methods: methods));
        } else {
          emit(PlanError(message: data['message']));
        }
      } catch (error) {
        emit(PlanError(message: error.toString()));
      }
    });

    on<PayPlan>((event, emit) async {
      emit(PlanLoading());
      try {
        Map<String, dynamic> data = await _controller.payPlan(
          event.plan.id!,
          event.image,
        );
        if (data['status']) {
          emit(PaymentDone(message: data['message']));
        } else {
          emit(PlanError(message: data['message']));
        }
      } catch (error) {
        emit(PlanError(message: error.toString()));
      }
    });
  }
}
