import 'dart:convert';
import 'dart:io';
import 'package:aquan/app/Plans/controller/plan_controller.dart';
import 'package:aquan/app/Plans/model/plan_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
          final String? userJson = prefs.getString('user_data');

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
          if (data['status']) {
            GetPaymentPlanMethodApiResModel getPaymentPlanMethodApiResModel =
                GetPaymentPlanMethodApiResModel.fromJson(data);
            emit(
              PaymentMethodsDone(
                methods: getPaymentPlanMethodApiResModel.accountInfo,
              ),
            );
          } else {
            emit(
              PlanError(
                message: data['message'],
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
            event.plan.id!,
            event.image,
          );
          if (data['status']) {
            emit(
              PaymentDone(
                message: data['message'],
              ),
            );
          } else {
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
  }
}
