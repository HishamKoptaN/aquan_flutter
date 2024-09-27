import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Helpers/storage.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<CheckLanguage>(
      (event, emit) {
        emit(LanguageInitial());
        if (Storage.getString('language') == null) {
          emit(SetLanguage());
        } else {
          emit(LanguageSeted());
        }
      },
    );
    on<SetLocale>((event, emit) {
      emit(LanguageInitial());

      Storage.setString("language", event.locale);

      emit(LanguageSeted());
    });
  }
}
