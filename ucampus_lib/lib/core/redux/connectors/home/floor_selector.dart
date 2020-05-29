import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/redux/actions/map_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/ui/widgets/home/floor_selector.dart';

class FloorSelectorConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => FloorSelector(
        selectedFloor: model.selectedFloor,
        onFloorSelected: model.onFloorSelected,
        cardShowed: model.cardShowed
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  int selectedFloor;
  Function(int) onFloorSelected;
  bool cardShowed;

  ViewModel.build({
    @required this.selectedFloor,
    @required this.onFloorSelected,
    @required this.cardShowed,
  }) : super(equals: [selectedFloor, cardShowed]);

  @override
  BaseModel fromStore() => ViewModel.build(
      onFloorSelected: (floor) =>
          dispatch(SelectFloorAction(selectedFloor: floor)),
      selectedFloor: state.currentFloor,
      cardShowed: (state.featuredSpaces.isNotEmpty));
}
