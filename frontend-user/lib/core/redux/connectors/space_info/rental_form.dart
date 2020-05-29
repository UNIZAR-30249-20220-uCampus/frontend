import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/rental/rental_form.dart';


class RentalFormConnector extends StatelessWidget {
  final Space space;
  
  RentalFormConnector({
    @required this.space,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          RentalForm(space: space, onRental: model.onRental),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(Timetable, String, bool) onRental;

  ViewModel.build({
    @required this.onRental,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
      onRental: (time, spaceID, isForRent) => dispatch(ReservationAction(
          time: time, spaceID: spaceID, isForRent: isForRent)));
}
