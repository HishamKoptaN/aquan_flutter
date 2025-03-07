import 'package:aquan/core/helpers/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<CheckLanguage>(
      (event, emit) {
        emit(LanguageInitial());
        if (SharedPrefHelper.getString(key: 'language') == null) {
          emit(SetLanguage());
        } else {
          emit(LanguageSeted());
        }
      },
    );
    on<SetLocale>(
      (event, emit) {
        emit(LanguageInitial());
        SharedPrefHelper.setData(key: "language", value: event.locale);
        emit(LanguageSeted());
      },
    );
  }
}
