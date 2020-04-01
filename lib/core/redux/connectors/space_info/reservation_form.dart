import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/models/timetable.dart';
import 'package:ucampus/core/redux/actions/reservation_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/space_info/reservation_form.dart';

class ReservationFormConnector extends StatelessWidget {
  final Space space;
  
  ReservationFormConnector({
    @required this.space,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          ReservationForm(space: space, onReservation: model.onReservation),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(Timetable, String, bool) onReservation;

  ViewModel.build({
    @required this.onReservation,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
      onReservation: (time, spaceID, isForRent) => dispatch(ReservationAction(
          time: time, spaceID: spaceID, isForRent: isForRent)));
}
