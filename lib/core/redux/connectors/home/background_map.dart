import 'package:async_redux/async_redux.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/actions/map_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/home/background_map.dart';

class BackgroundMapConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => BackgroundMap(
        selectedFloor: model.selectedFloor,
        onMapTap: model.onMapTap,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  int selectedFloor;
  Function(LatLng) onMapTap;

  ViewModel.build({
    @required this.selectedFloor,
    @required this.onMapTap,
  }) : super(equals: [selectedFloor]);

  @override
  BaseModel fromStore() => ViewModel.build(
      selectedFloor: state.currentFloor,
      onMapTap: (latlng) => dispatch(SpaceTapAction(tappedPosition: latlng)));
}
