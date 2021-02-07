part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchStartState extends SearchState {
  const SearchStartState(
      {@required this.searchText, @required this.searchSuggestions});
  final String searchText;
  final List<SearchSuggestionModel> searchSuggestions;
  @override
  //TODO: implement props
  List<Object> get props => [searchText, searchSuggestions];
}

class SearchSuggestionsState extends SearchState {
  const SearchSuggestionsState(
      {@required this.searchText, this.searchSuggestions});
  final String searchText;
  final List<SearchSuggestionModel> searchSuggestions;
  @override
  //TODO: implement props
  List<Object> get props => [searchText, searchSuggestions];
}

class SearchInProgressState extends SearchState {
  const SearchInProgressState();
  @override
  //TODO: implement props
  List<Object> get props => [];
}

class SearchNoState extends SearchState {
  @override
  //TODO: implement props
  List<Object> get props => null;
}
