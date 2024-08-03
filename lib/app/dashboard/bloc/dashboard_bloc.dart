import 'package:aquan/app/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/dashboard_model.dart';
import 'dashboard_state.dart';
part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardController _dashboardController = DashboardController();

  DashboardBloc() : super(HomeInitial()) {
    on<GetDashboardDetails>(
      (event, emit) async {
        Map<String, dynamic> data = await _dashboardController.getDashboard();
        if (data['status']) {
          GetDashboardApiResModel getDashboardApiResModel =
              GetDashboardApiResModel.fromJson(data);

          emit(
            DashboardLoaded(
              transactions: getDashboardApiResModel.transactions!,
              currencies: getDashboardApiResModel.currencies!,
            ),
          );
        } else if (!data['status']) {
          emit(DashboardError(message: data['error']));
        }
      },
    );
    on<GetServices>(
      (event, emit) async {
        final Map<String, dynamic> response =
            await _dashboardController.services();
        if (response['status'] == true) {
          emit(DoneServices(services: response['content']));
        } else {
          throw Exception("Error try again");
        }
      },
    );
  }
}
