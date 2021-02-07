import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';

class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  AppBarBloc() : super(AppBarNoState());

  @override
  Stream<AppBarState> mapEventToState(AppBarEvent event) async* {
    if (event is DisplayBackIconEvent) {
      yield AppBarPopState(
          displayBack: true, displayCancel: false, displaySearchField: true);
    }
  }
}
