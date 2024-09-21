// Define Bloc
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts_event.dart';
import 'layouts_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial());

  @override
  Stream<BottomNavState> mapEventToState(BottomNavEvent event) async* {
    if (event is UpdateIndex) {
      yield BottomNavUpdated(event.newIndex);
    }
  }
}
