part of 'app_bar_bloc.dart';

abstract class AppBarState extends Equatable {
  const AppBarState();
}

class AppBarNoState extends AppBarState {
  const AppBarNoState();
  @override
  //TODO: implement props
  List<Object> get props => [];
}

class AppBarPopState extends AppBarState {
  const AppBarPopState(
      {@required this.displaySearchField,
      @required this.displayCancel,
      @required this.displayBack});
  final bool displaySearchField;
  final bool displayBack;
  final bool displayCancel;
  @override
  //TODO: implement props
  List<Object> get props => [displaySearchField, displayBack, displayCancel];
}
