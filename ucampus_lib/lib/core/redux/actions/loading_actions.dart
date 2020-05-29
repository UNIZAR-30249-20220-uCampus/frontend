import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';

class SetLoadingAction extends ReduxAction<AppState> {
  final bool isLoading;
  SetLoadingAction({@required this.isLoading});

  @override
  AppState reduce() {
    return state.copy(isLoading: this.isLoading);
  }
}
