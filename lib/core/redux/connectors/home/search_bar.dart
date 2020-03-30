import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/actions/map_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/home/search_bar.dart';

class SearchBarConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => SearchBar(
        onSearch: model.onSearch,
        isLoading: model.isLoading,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(String) onSearch;
  bool isLoading;

  ViewModel.build({
    @required this.onSearch,
    @required this.isLoading,
  }) : super(equals: [isLoading]);

  @override
  BaseModel fromStore() => ViewModel.build(
        onSearch: (text) => dispatch(SearchSpacesAction(searchText: text)),
        isLoading: state.isLoading,
      );
}
