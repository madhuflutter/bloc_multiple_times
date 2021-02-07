import 'package:bloc_listener_poc/bloc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/models/global.dart';
import 'package:bloc_listener_poc/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar.dart';
import 'search_results_view.dart';
import 'search_view.dart';


class SearchResultsViewOne extends StatelessWidget {
  final String  searchText;
  SearchResultsViewOne({@required this.searchText});
  final String searchInitiatedRoute = 'search_results_one';

  @override
  Widget build(BuildContext context) {
    print('Issue log: SearchResultsViewOne builder');
    List<Product> searchedProducts =[Product(title: 'product 1'), Product(title: 'product 2')];
    return Scaffold(
      body: Container(
          child: SearchProductsList(
            searchedProducts: searchedProducts, searchInitiatedRoute: searchInitiatedRoute,
          )),
      //bottomNavigationBar: BottomNavigBar(0),
    );
  }
}

