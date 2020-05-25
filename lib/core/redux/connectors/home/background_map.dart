import 'package:async_redux/async_redux.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
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
        onMapTap: model.onMapTap, featuredSpaces: model.featuredSpaces, onFeaturedSpaceTap: (_) {  },
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  int selectedFloor;
  List<Space> featuredSpaces;
  Function(LatLng) onMapTap;

  ViewModel.build({
    @required this.selectedFloor,
    @required this.onMapTap,
    @required this.featuredSpaces,
  }) : super(equals: [selectedFloor, featuredSpaces]);

  @override
  BaseModel fromStore() => ViewModel.build(
      featuredSpaces: state.featuredSpaces,
      selectedFloor: state.currentFloor,
      onMapTap: (latlng) => dispatch(SpaceTapAction(tappedPosition: latlng)));
}
