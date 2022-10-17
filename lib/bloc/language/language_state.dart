part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitialSuccess extends LanguageState {
  final String language;
  const LanguageInitialSuccess({required this.language});

}

class LanguageLoading extends LanguageState {}
class LanguageSuccess extends LanguageState {
  final String language;
  const LanguageSuccess({required this.language});
}

