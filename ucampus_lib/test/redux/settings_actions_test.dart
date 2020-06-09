import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ucampus_lib/core/redux/actions/settings_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/locator.dart';

void main() {
  var storeTester;
  bool originalExternalUser = true;

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        externalUser: originalExternalUser,
      ),
    );
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('TypeUserAction', () {
    test('should set user type', () async {
      expect(storeTester.state.externalUser, originalExternalUser);
      storeTester.dispatch(
        TypeUserAction(
            externalUser: false),
      );
      await storeTester.wait(TypeUserAction);
      expect(storeTester.state.externalUser,
          false);
    });
  });
}
