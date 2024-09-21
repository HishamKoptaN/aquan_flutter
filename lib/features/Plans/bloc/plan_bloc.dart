import 'dart:convert';
import 'dart:io';
import 'package:aquan/features/Plans/controller/plan_controller.dart';
import 'package:aquan/features/Plans/model/plan_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../deposit/model/employee_account.dart';
import '../model/payment_plan.dart';
part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  final PlanController _planController = PlanController();
  bool isAccept = false;
  PlanBloc() : super(PlanInitial()) {
    on<GetPlans>(
      (event, emit) async {
        emit(PlanLoading());
        try {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? userJson = prefs.getString('user');

          Map<String, dynamic>? userData = json.decode(userJson!);
          Map<String, dynamic> data = await _planController.getPlans();
          GetPlansApiResModel getPlansApiResModel =
              GetPlansApiResModel.fromJson(data);
          if (data["status"]) {
            emit(
              PlansDone(
                plans: getPlansApiResModel.plans,
                userPlanId: userData!['plan_id'],
                startDate: userData['created_at'],
                endDate: userData['created_at'],
              ),
            );
          } else if (data["status"]) {
            emit(
              PlanError(
                message: "data['message']",
              ),
            );
          }
        } catch (error) {
          emit(
            PlanError(
              message: error.toString(),
            ),
          );
        }
      },
    );

    on<GetPaymentMethods>(
      (event, emit) async {
        emit(PlanLoading());
        try {
          Map<String, dynamic> data = await _planController.getPaymentMethods();
          GetPlansRatesApiResModel getPlansRatesApiResModel =
              GetPlansRatesApiResModel.fromJson(data);
          if (data['status']) {
            emit(
              PlansRatesDone(
                getPlansRatesApiResModel: getPlansRatesApiResModel,
              ),
            );
          } else if (!data['status']) {
            emit(
              PlanError(
                message: data['error'],
              ),
            );
          }
        } catch (error) {
          emit(
            PlanError(
              message: error.toString(),
            ),
          );
        }
      },
    );

    on<PayPlan>(
      (event, emit) async {
        emit(PlanLoading());
        try {
          Map<String, dynamic> data = await _planController.payPlan(
            id: event.planId,
            file: event.image,
            method: event.method,
          );
          if (data['status']) {
            emit(
              PlanPayedSuccessfully(),
            );
          } else if (!data['status']) {
            emit(
              PlanError(
                message: data['message'],
              ),
            );
          }
        } catch (error) {
          emit(PlanError(message: error.toString()));
        }
      },
    );
    on<EmitState>(
      (event, emit) async {
        GetPlansRatesApiResModel? getPlansRatesApiResModel;
        emit(
          PlansRatesDone(
            getPlansRatesApiResModel: getPlansRatesApiResModel!,
          ),
        );
      },
    );
  }
}
