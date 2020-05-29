import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus/ui/router.dart';
import 'package:ucampus_lib/locator.dart';
import 'package:ucampus_lib/ui/shared/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  final Store store = Store<AppState>(
    initialState: AppState.initialState(),
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
    stateObservers: [StateLogger()],
  );

  runApp(StoreProvider<AppState>(
    store: store,
    child: UCampus(),
  ));
}

class UCampus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'uCampus',
      navigatorKey: navigatorKey,
      theme: uCampusTheme,
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class StateLogger implements StateObserver<AppState> {
  @override
  void observe(ReduxAction<AppState> action, AppState stateIni,
      AppState stateEnd, int dispatchCount) {
    print(stateEnd.toString());
  }
}
