part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}


class LanguageInitial extends LanguageEvent {}

class SetLanguage extends LanguageEvent {
  String idioma;
  SetLanguage({required this.idioma});
}

class GetLanguage extends LanguageEvent {}