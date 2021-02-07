import 'package:bloc_listener_poc/bloc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/models/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar.dart';
import 'package:flutter/scheduler.dart';

class SearchSuggestions extends StatelessWidget {
  final String searchInitiatedRoute;
  SearchSuggestions({ this.searchInitiatedRoute});
  @override
  Widget build(BuildContext context) {
    print('Issue log: SearchSuggestions builder');
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      print('Issue log: SearchSuggestions BlocBuilder, ' + state.toString());

      if (state is SearchSuggestionsState) {

        return ListView.builder(
            itemCount: state.searchSuggestions.length,
            padding: EdgeInsets.all(2.0),
            itemBuilder: (_, index) {
              //print(snapshot.data[index].suggestion);
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();

                  global.searchToResultsTransition = true;
                  global.searchInitiatedRoute = searchInitiatedRoute;
                  if (searchInitiatedRoute == 'search_results') {
                    Navigator.pushNamed(context, '/search_results_one',
                        arguments: state.searchSuggestions[index].suggestion);
                  }
                  else {Navigator.pushNamed(context, '/search_results',
                      arguments: state.searchSuggestions[index].suggestion);}

                  context.bloc<SearchBloc>().add(StartSearchBlocEvent());
                },
                child: Text(state.searchSuggestions[index].suggestion,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 10.0)),
              );
            });
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
