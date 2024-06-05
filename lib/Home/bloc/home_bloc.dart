import 'package:aquan/Controllers/home_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeController _controller = HomeController();
  HomeBloc() : super(HomeInitial()) {
    on<GetServices>((event, emit) async {
      final Map<String, dynamic> response = await _controller.services();

      if (response['status'] == true) {
        emit(DoneServices(services: response['content']));
      } else {
        throw Exception("Error try again");
      }
    });
  }
}
