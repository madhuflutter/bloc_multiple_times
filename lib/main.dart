import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:bloc_listener_poc/screens/app_view.dart';
import 'package:bloc_listener_poc/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_listener_poc/core/router.dart' as appRouter;

import 'dart:async';

import 'bloc/appBarBloc/app_bar_bloc.dart';
import 'bloc/searchBloc/search_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  runApp(new InitializeApp());
}

class InitializeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingAppStfl();
  }
}

class ShoppingAppStfl extends StatefulWidget {
  @override
  _ShoppingAppStflState createState() => _ShoppingAppStflState();
}

class _ShoppingAppStflState extends State<ShoppingAppStfl> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc()..add(StartSearchBlocEvent()),
        ),
        BlocProvider<AppBarBloc>(
          create: (context) => AppBarBloc()..add(StartAppBarBlocEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppView(),
        onGenerateRoute: appRouter.Router.generateRoute,
      ),
    );
  }
}
