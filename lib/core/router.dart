import 'package:bloc_listener_poc/models/product.dart';
import 'package:bloc_listener_poc/screens/cart_view.dart';
import 'package:bloc_listener_poc/screens/home_view.dart';
import 'package:bloc_listener_poc/screens/search_results_view.dart';
import 'package:bloc_listener_poc/screens/search_results_view_1.dart';
import 'package:bloc_listener_poc/screens/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    print('Issue log: Router, ' +settings.name);

    switch (settings.name) {

      case '/':

        return null;
      case '/home':

        return MaterialPageRoute(
            settings: settings, builder: (_) => HomeView());
      case '/cart':

        return MaterialPageRoute(
            settings: settings, builder: (_) => CartView());

      case '/search_results':
        String _searchText = settings.arguments;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SearchResultsView(
                  searchText: _searchText,
                ));
      case '/search_results_one':
        String _searchText = settings.arguments;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => SearchResultsViewOne(
              searchText: _searchText,
            ));

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
