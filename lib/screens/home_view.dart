import 'package:bloc_listener_poc/bloc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/models/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: HomeViewBody()),
    );
  }
}

class HomeViewBody extends StatefulWidget {
  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  final String searchInitiatedRoute = 'home';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init State is called meaning transition is completed
    global.searchToResultsTransition = false;

  }

  @override
  Widget build(BuildContext context) {
    print('Issue log: HomeView builder');
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {

      print('Issue log: HomeView BlocBuilder, ' + state.toString());
      if (state is SearchSuggestionsState ||
          state is SearchInProgressState) {
        return Container(child: SearchSuggestions(searchInitiatedRoute: searchInitiatedRoute,));
      } else {
        if (global.searchInitiatedRoute == searchInitiatedRoute) {
          return const CircularProgressIndicator();
        } else {
          return Center(child: Text('Home Page', style: TextStyle(color: Colors.red),));
        }
      }
    }
    );
    }
}
