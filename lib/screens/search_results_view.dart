import 'package:bloc_listener_poc/bloc/searchBloc/search_bloc.dart';
import 'package:bloc_listener_poc/models/global.dart';
import 'package:bloc_listener_poc/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bar.dart';
import 'search_view.dart';


class SearchResultsView extends StatelessWidget {
  final String  searchText;
  SearchResultsView({@required this.searchText});
  final String searchInitiatedRoute = 'search_results';
  @override
  Widget build(BuildContext context) {
    print('Issue log: SearchResultsView builder');

    List<Product> searchedProducts =[Product(title: 'product 1'), Product(title: 'product 2')];
    return Scaffold(
      body: Container(
          child: SearchProductsList(
            searchedProducts: searchedProducts,searchInitiatedRoute: searchInitiatedRoute,
          )),
      //bottomNavigationBar: BottomNavigBar(0),
    );
  }
}

class SearchProductsList extends StatefulWidget {
  final List<Product> searchedProducts;
  final String searchInitiatedRoute;
  SearchProductsList({@required this.searchedProducts, @required this.searchInitiatedRoute});
  @override
  _SearchProductsListState createState() => _SearchProductsListState();
}

class _SearchProductsListState extends State<SearchProductsList> {
  @override
  Widget build(BuildContext context) {
    print('Issue log: SearchProductsList builder');
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      print('Issue log: SearchProductsList BlocBuilder,' + state.toString());
      if (state is SearchSuggestionsState ||
          state is SearchInProgressState) {
        return Container(child: SearchSuggestions(searchInitiatedRoute: widget.searchInitiatedRoute,));
      } else {

        if (global.searchInitiatedRoute == widget.searchInitiatedRoute) {
          return const CircularProgressIndicator();
        } else {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  itemCount: widget.searchedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = widget.searchedProducts[index];
                    return Text(product.title,style: TextStyle(color: Colors.red),);
                  },
                ),
              ),
            ],
          );

        }
      }
    });


  }
}
