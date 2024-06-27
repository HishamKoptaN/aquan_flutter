import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition $transition occurred in bloc $bloc');
    // يمكنك هنا تنفيذ أي تعليمات برمجية إضافية تحتاجها عند حدوث انتقال في Bloc
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event $event occurred in bloc $bloc');
    // يمكنك هنا تنفيذ أي تعليمات برمجية إضافية تحتاجها عند حدوث حدث معين
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('Error $error occurred in bloc $bloc');
    // يمكنك هنا تنفيذ أي تعليمات برمجية للتعامل مع الأخطاء التي قد تحدث في Bloc
  }
}
