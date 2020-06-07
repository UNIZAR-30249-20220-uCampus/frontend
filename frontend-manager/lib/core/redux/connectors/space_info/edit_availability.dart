import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_manager/ui/widgets/space_info/edit_availability_form.dart';

class EditAvailabilityConnector extends StatelessWidget {
  final Space space;
  
  EditAvailabilityConnector({
    @required this.space,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          EditAvailabilityForm(space: space, onReservation: model.onReservation, externalUser: model.externalUser,),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(Timetable, String, bool, String) onReservation;
  bool externalUser;

  ViewModel.build({
    @required this.onReservation,
    @required this.externalUser,
  }) : super(equals: [externalUser]);

  @override
  BaseModel fromStore() => ViewModel.build(
      externalUser: state.externalUser,
       onReservation: (time, spaceID, isForRent, userID) => dispatch(ReservationAction(
          time: time, spaceID: spaceID, isForRent: isForRent, userID: userID)));
}
