import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:universalapp/bloc/language/language_bloc.dart';
import 'package:universalapp/bloc/navigator/navigation_bloc.dart';
import 'package:universalapp/ui/screen/DashboardScreen.dart';
import 'package:universalapp/ui/screen/HomeScreen.dart';
import 'package:universalapp/ui/screen/places/PlaceScreen.dart';
import 'package:universalapp/util/UniversalColors.dart';

import 'util/Constants.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Locale? locale;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        print("$state");
        if(state is LanguageInitialSuccess)
        {
          print("Lenguage recuperado: ${state.language}");
          if(state.language != "")
          {
            locale = Locale(state.language);
            return MaterialApp(
              locale: locale,
              onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: [
                Locale("es"),
                Locale("en")
              ],
              theme: ThemeData(
                primaryColor: UniversalColors.primary,
              ),
              home: BlocBuilder<NavigationBloc, NavigationState>(
                builder: (_, state) {
                  if (kDebugMode) {
                    print("State is : -> $state");
                  }
                  if (state is StateHome) {
                    return HomeScreeen(idioma: locale?.languageCode == "en" ? 1 : 2,version: state.code);
                  }
                  if (state is StateDashboard) {
                    return DashboardScreeen();
                  }
                  if(state is StatePlace){
                    return PlaceScreeen();
                  }
                  else {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
            );
          }else{
            return MaterialApp(
              home: const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }

        }
        return MaterialApp(
          home: const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
