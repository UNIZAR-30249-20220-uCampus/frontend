import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus_lib/core/redux/actions/settings_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/settings/type_user.dart';

class TypeUserConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      distinct: true,
      model: ViewModel(),
      builder: (context, model) => TypeUser(
        externalUser: model.externalUser,
        onTypeUserChanged: model.onTypeUserChanged,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  bool externalUser;
  Function(bool) onTypeUserChanged;

  ViewModel.build({
    @required this.externalUser,
    @required this.onTypeUserChanged,
  }) : super(equals: [externalUser]);


  @override
  BaseModel fromStore() => ViewModel.build(
        externalUser: state.externalUser,
         onTypeUserChanged: (externalUser) =>
          dispatch(TypeUserAction(externalUser: externalUser)),
      );
}
