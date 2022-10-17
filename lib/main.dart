
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universalapp/bloc/language/language_bloc.dart';
import 'package:universalapp/bloc/navigator/navigation_bloc.dart';
import 'package:universalapp/home.dart';

import 'bloc/AppBlocObserver.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(()
    {
      runApp(MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc()..add(AppStarted())
        ),
        BlocProvider<LanguageBloc>(
            create: (_) => LanguageBloc()..add(LanguageInitial())
        ),
    ], child: Home());
  }
}