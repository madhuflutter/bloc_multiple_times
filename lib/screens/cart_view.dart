import 'package:bloc_listener_poc/bloc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/models/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar.dart';
import 'search_view.dart';

class CartView extends StatelessWidget {
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(child: CartViewBody()),
    );
  }
}

class CartViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchSuggestionsState ||
          state is SearchInProgressState) {
        return Container(child: SearchSuggestions());
      } else {
        if (global.searchToResultsTransition) {
          return const CircularProgressIndicator();
        } else {
          return Text('Cart Page', style: TextStyle(color: Colors.red),);
        }
      }
    }


    );
  }
}
