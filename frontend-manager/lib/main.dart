import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_manager/ui/router.dart';
import 'package:ucampus_lib/locator.dart';
import 'package:ucampus_lib/ui/shared/theme.dart';
import 'package:ucampus_lib/ui/widgets/misc/error_dialog.dart';

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
      title: 'uCampus_manager',
      navigatorKey: navigatorKey,
      theme: uCampusTheme,
       home: UserExceptionDialog<AppState>(
         child: Navigator(
           initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
         ),
         onShowUserExceptionDialog: showUserExceptionDialog,
       ),
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
