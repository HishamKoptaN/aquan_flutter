import 'package:aquan/features/Plans/controller/plan_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/referals_model.dart';
part 'referals_event.dart';
part 'referals_state.dart';

class ReferalsBloc extends Bloc<ReferalsEvent, ReferalsState> {
  final PlanController _planController = PlanController();
  bool isAccept = false;
  ReferalsBloc() : super(ReferalsInitial()) {
    on<GetReferals>(
      (event, emit) async {
        emit(ReferalsLoading());
        Map<String, dynamic> data = await _planController.getPaymentMethods();
        GetReferalsApiResModel getReferalsApiResModel =
            GetReferalsApiResModel.fromJson(data);
        if (data['status']) {
          emit(
            ReferalsLoadedSuccessfully(
              getReferalsApiResModel: getReferalsApiResModel,
            ),
          );
        } else if (!data['status']) {
          emit(
            ReferalsError(
              message: data['message'],
            ),
          );
        }
      },
    );
    on<EmitState>(
      (event, emit) async {
        // emit(

        // );
      },
    );
  }
}
