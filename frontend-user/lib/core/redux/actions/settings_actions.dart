import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus/core/redux/app_state.dart';

class TypeUserAction extends ReduxAction<AppState> {
  final bool externalUser;
  TypeUserAction({@required this.externalUser});

  @override
  AppState reduce() {
    return state.copy(externalUser: this.externalUser);
  }
}
