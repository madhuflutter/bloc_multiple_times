part of 'app_bar_bloc.dart';

abstract class AppBarEvent extends Equatable {
  const AppBarEvent();
}

class StartAppBarBlocEvent extends AppBarEvent {
  const StartAppBarBlocEvent();
  @override
  List<Object> get props => [];
}

class DisplayBackIconEvent extends AppBarEvent {
  const DisplayBackIconEvent();
  @override
  List<Object> get props => [];
}
