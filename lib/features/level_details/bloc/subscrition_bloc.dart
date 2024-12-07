import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/subscribtion_model.dart';
import 'subscrition_event.dart';
import 'subscrition_state.dart';

class SubscritionDetailsBloc
    extends Bloc<SubscritionDetailsEvent, SubscritionDetailsState> {
  SubscritionDetailsBloc() : super(SubscritionDetailsInitial()) {
    on<GetSubscribtionDetailsEvent>((event, emit) async {
      emit(SubscritionDetailsLoading());
      try {} catch (e) {
        print('Exception in bloc: $e'); // طباعة الاستثناء
        emit(SubscritionDetailsError(message: 'Exception: ${e.toString()}'));
      }
    });
  }
}
