import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigator_bar_event.dart';
part 'navigator_bar_state.dart';

class NavigatorBarBloc extends Bloc<NavigatorBarEvent, NavigatorBarState> {
  NavigatorBarBloc() : super(NavigatorBarInitial()) {
    on<NavigatorBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
