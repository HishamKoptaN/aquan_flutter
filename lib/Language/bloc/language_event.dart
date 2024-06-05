part of 'language_bloc.dart';

abstract class LanguageEvent {}

class CheckLanguage extends LanguageEvent {}

class SetLocale extends LanguageEvent {
  SetLocale({required this.locale});

  final String locale;
}
