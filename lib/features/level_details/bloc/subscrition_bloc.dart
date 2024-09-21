import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/subscribtion_controller.dart';
import '../model/subscribtion_model.dart';
import 'subscrition_event.dart';
import 'subscrition_state.dart';

class SubscritionDetailsBloc
    extends Bloc<SubscritionDetailsEvent, SubscritionDetailsState> {
  final SubscribtionController _controller = SubscribtionController();

  SubscritionDetailsBloc() : super(SubscritionDetailsInitial()) {
    on<GetSubscribtionDetailsEvent>((event, emit) async {
      emit(SubscritionDetailsLoading());
      try {
        final data = await _controller.getUserLevelDetails();
        print('Data received in bloc: $data'); // طباعة البيانات المستلمة

        if (data['status'] == true) {
          emit(SubscritionDetailsLoaded(
              subscribtionDetails: SubscribtionModel.fromJson(data['data'])));
        } else {
          emit(SubscritionDetailsError(
              message: data['error'] ?? 'Unknown error: ${data.toString()}'));
        }
      } catch (e) {
        print('Exception in bloc: $e'); // طباعة الاستثناء
        emit(SubscritionDetailsError(message: 'Exception: ${e.toString()}'));
      }
    });
  }
}
