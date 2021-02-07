import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:bloc_listener_poc/models/product.dart';
import 'package:bloc_listener_poc/models/search_suggestion.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchNoState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    List<SearchSuggestionModel> _searchSuggestions = [];
    if (event is StartSearchBlocEvent || event is ReStartSearchBlocEvent || event is SearchBackEvent) {
      yield SearchNoState();
    } else if (event is SearchTapEvent) {
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 1'));
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 2'));
      yield SearchSuggestionsState(
          searchText: event.searchText, searchSuggestions: _searchSuggestions);
    } else if (event is SearchTypeEvent) {
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 3'));
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 1'));
      _searchSuggestions.add(SearchSuggestionModel(suggestion: 'suggestion 2'));
      yield SearchSuggestionsState(
          searchText: event.searchText, searchSuggestions: _searchSuggestions);
    }
  }
}
