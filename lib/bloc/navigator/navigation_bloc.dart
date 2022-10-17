import 'dart:async';
import 'dart:ffi';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on(manejoEventos);
  }

  Future<void> manejoEventos(NavigationEvent event, Emitter<NavigationState> emiter) async {
    if (event is AppStarted || event is NavigateToHome)
    {
      final prefs = await SharedPreferences.getInstance();
      bool? logueado = prefs.getBool('logueado');
      if(logueado != null && logueado)
      {
        if (kDebugMode) {
          print("Navigate: DashboardScreen");
        }
        emiter(StateDashboard());
      }else{
        if (kDebugMode) {
          print("Navigate: HomeScreen");
        }
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String version = packageInfo.version;
        String code = kDebugMode == true? "Debug-$version" : "Release-$version";
        emiter(StateHome(code));
      }

    }
    if(event is NavigateToDashboard)
    {
      if (kDebugMode) {
        print("Navigate: DashboardScreen");
      }
      emiter(StateDashboard());
    }
    if(event is NavigateToPlace)
    {
      if (kDebugMode) {
        print("Navigate: PlaceScreen");
      }
      emiter(StatePlace());
    }
  }
}
