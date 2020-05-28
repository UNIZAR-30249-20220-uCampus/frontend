import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/actions/map_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/filter/apply_button.dart';

class ApplyButtonConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function>(
      converter: (store) => () => store.dispatchFuture(ApplyFilterAction()),
      builder: (context, onApplied) => ApplyButton(onApplied: onApplied),
    );
  }
}