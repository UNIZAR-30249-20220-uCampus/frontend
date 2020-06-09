import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ucampus_lib/core/redux/actions/loading_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/locator.dart';

void main() {
  var storeTester;
  bool originalisLoading = false;

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        isLoading: originalisLoading,
      ),
    );
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('SetLoadingAction', () {
    test('should set loading value', () async {
      expect(storeTester.state.isLoading, originalisLoading);
      storeTester.dispatch(
        SetLoadingAction(
            isLoading: true),
      );
      await storeTester.wait(SetLoadingAction);
      expect(storeTester.state.isLoading,
          true);
    });
  });
}
