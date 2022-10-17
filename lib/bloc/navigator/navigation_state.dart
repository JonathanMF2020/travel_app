part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
}

class StateHome extends NavigationState {
  final String code;
  const StateHome(this.code);
}
class StateDashboard extends NavigationState {}
class StatePlace extends NavigationState {}
