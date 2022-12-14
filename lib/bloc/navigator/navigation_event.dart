part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends NavigationEvent {}

class NavigateToHome extends NavigationEvent {}
class NavigateToDashboard extends NavigationEvent {}
class NavigateToPlace extends NavigationEvent {}