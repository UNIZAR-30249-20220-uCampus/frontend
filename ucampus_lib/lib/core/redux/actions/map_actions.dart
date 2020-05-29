import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:latlong/latlong.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/redux/actions/loading_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/locator.dart';

class SpaceTapAction extends ReduxAction<AppState> {
  final LatLng tappedPosition;

  SpaceTapAction({@required this.tappedPosition});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    Space tappedSpace = await apiService.getSpaceInformation(
      state.currentFloor,
      this.tappedPosition,
    );
    if (tappedSpace == null) {
      return null;
    }
    dispatch(SetLoadingAction(isLoading: false));
    return state.copy(featuredSpaces: [tappedSpace]);
  }
}

class ApplyFilterAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    List<Space> results = await apiService.filterSpaces(state.filterCriteria);
    if (results.length == 0) {
      //TODO: mostrar algún tipo de pop up informando
      return null;
    }
    dispatch(SetLoadingAction(isLoading: false));
    return state.copy(
      featuredSpaces: results,
      appliedCriteria: state.filterCriteria.activeCriteria,
    );
  }
}

class SelectFloorAction extends ReduxAction<AppState> {
  final int selectedFloor;

  SelectFloorAction({@required this.selectedFloor});

  @override
  AppState reduce() {
    return state.copy(currentFloor: this.selectedFloor);
  }
}
