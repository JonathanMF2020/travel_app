
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {

  LanguageBloc() : super(LanguageInitialSuccess(language:"")) {
    on(manejoEventos);
  }

  Future<void> manejoEventos(LanguageEvent event, Emitter<LanguageState> emiter) async {
    if (event is LanguageInitial)
    {
      final prefs = await SharedPreferences.getInstance();
      final String? language = prefs.getString('language');
      if(language == null)
      {
        emiter(LanguageInitialSuccess(language: "en"));
      }else{
        emiter(LanguageInitialSuccess(language: language));
      }
    }
    if(event is GetLanguage)
    {
      final prefs = await SharedPreferences.getInstance();
      final String? language = prefs.getString('language');
      emiter(LanguageSuccess(language: language!));
    }
    if (event is SetLanguage)
    {
      emiter(LanguageLoading());
      emiter(LanguageInitialSuccess(language: event.idioma));

    }
  }
}