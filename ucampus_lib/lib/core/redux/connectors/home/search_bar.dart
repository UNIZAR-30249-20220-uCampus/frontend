import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/actions/map_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/ui/widgets/home/search_bar.dart';

class SearchBarConnector extends StatelessWidget {
  final Function() openDrawer;

  const SearchBarConnector({this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => SearchBar(
        onSearch: model.onSearch,
        isLoading: model.isLoading,
        openDrawer: openDrawer,
        setFilterActive: model.setFilterActive,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(String) onSearch;
  Function(bool) setFilterActive;
  bool isLoading;

  ViewModel.build({
    @required this.onSearch,
    @required this.isLoading,
    @required this.setFilterActive,
  }) : super(equals: [isLoading]);

  @override
  BaseModel fromStore() => ViewModel.build(
      onSearch: (text) {
        dispatch(
          SetFilterValueAction(criteriaKind: CriteriaKind.NAME, value: text),
        );
        dispatch(ApplyFilterAction());
      },
      isLoading: state.isLoading,
      setFilterActive: (state) {
        if (state) {
          dispatch(AddFilterCriteriaAction(criteriaKind: CriteriaKind.NAME));
        } else {
          dispatch(RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.NAME));
        }
      });
}
