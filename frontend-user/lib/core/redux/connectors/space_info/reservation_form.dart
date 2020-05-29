import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/reservation/reservation_form.dart';

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
          ReservationForm(space: space, onReservation: model.onReservation, externalUser: model.externalUser,),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(Timetable, String, bool) onReservation;
  bool externalUser;

  ViewModel.build({
    @required this.onReservation,
    @required this.externalUser,
  }) : super(equals: [externalUser]);

  @override
  BaseModel fromStore() => ViewModel.build(
      externalUser: state.externalUser,
      onReservation: (time, spaceID, isForRent) => dispatch(ReservationAction(
          time: time, spaceID: spaceID, isForRent: isForRent)));
}
