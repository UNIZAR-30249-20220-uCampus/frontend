import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_manager/ui/widgets/space_info/edit_bookable_form.dart';

class EditBookableConnector extends StatelessWidget {
  final Space space;
  
  EditBookableConnector({
    @required this.space,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) =>
          EditBookableForm(space: space, onBookableLeasable: model.onBookableLeasable,),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  Function(String, bool, bool) onBookableLeasable;

  ViewModel.build({
    @required this.onBookableLeasable,
  }) : super(equals: []);

  @override
  BaseModel fromStore() => ViewModel.build(
       onBookableLeasable: (spaceID, bookable, leasable) => dispatch(EditBookableLeasableAction(space: spaceID, bookable: bookable, leasable:leasable
          )));
}
