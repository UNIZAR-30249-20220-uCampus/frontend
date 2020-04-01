import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/core/redux/actions/loading_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:ucampus/locator.dart';

class ReservationAction extends ReduxAction<AppState> {
  final Timetable time;
  final String spaceID;
  final bool isForRent;

  ReservationAction(
      {@required this.time, @required this.spaceID, @required this.isForRent});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    ReservationResult reservationResult = await apiService.makeReservation(
      this.time,
      this.spaceID,
      this.isForRent,
    );
    dispatch(SetLoadingAction(isLoading: false));

    if (reservationResult == ReservationResult.error) {
      return state; //TODO: mostrar algún tipo de pop up informando
    } else if (reservationResult == ReservationResult.success) {
      return state; //TODO: mostrar algún tipo de pop up informando
    } else {
      return null;
    }
  }
}
