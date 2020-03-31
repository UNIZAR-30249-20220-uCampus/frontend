import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:latlong/latlong.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/redux/actions/map_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:ucampus/locator.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  var storeTester;
  var mockApi;

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        featuredSpaces: List.generate(
          6,
          (index) => Space.randomSpace(labNumber: index),
        ),
      ),
    );
    mockApi = MockApiService();
    locator.registerSingleton<ApiService>(mockApi);
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('SpaceTapAction', () {
    test('should feature only one space when tapped on a valid space',
        () async {
      when(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)))
          .thenAnswer((_) => Future.value(Space.randomSpace()));

      expect(
          storeTester.state.featuredSpaces,
          List.generate(
            6,
            (index) => Space.randomSpace(labNumber: index),
          ));

      storeTester.dispatch(SpaceTapAction(tappedPosition: LatLng(42.0, 1.0)));
      await storeTester.wait(SpaceTapAction);

      expect(storeTester.lastInfo.state.featuredSpaces, [Space.randomSpace()]);
      verify(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)));
    });

    test('should keep featured spaces when tapped on an invalid space',
        () async {
      when(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)))
          .thenAnswer((_) => Future.value(null));

      expect(
          storeTester.state.featuredSpaces,
          List.generate(
            6,
            (index) => Space.randomSpace(labNumber: index),
          ));

      storeTester.dispatch(SpaceTapAction(tappedPosition: LatLng(42.0, 1.0)));
      await storeTester.wait(SpaceTapAction);

      expect(
        storeTester.lastInfo.state.featuredSpaces,
        List.generate(
          6,
          (index) => Space.randomSpace(labNumber: index),
        ),
      );
      verify(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)));
    });
  });

  group('SearchSpacesAction', () {
    test('should feature spaces when there is a match', () async {
      when(mockApi.filterSpaces(any)).thenAnswer((_) => Future.value(
            List.generate(
              3,
              (index) => Space.randomSpace(labNumber: index),
            ),
          ));

      expect(
          storeTester.state.featuredSpaces,
          List.generate(
            6,
            (index) => Space.randomSpace(labNumber: index),
          ));

      storeTester.dispatch(SearchSpacesAction(searchText: 'blabla...'));
      await storeTester.waitUntil(SearchSpacesAction);

      expect(
          storeTester.lastInfo.state.featuredSpaces,
          List.generate(
            3,
            (index) => Space.randomSpace(labNumber: index),
          ));
      verify(mockApi.filterSpaces(FilterCriteria()));
    });

    test('should keep featured spaces when there are no matches', () async {
      when(mockApi.filterSpaces(any)).thenAnswer((_) => Future.value(<Space>[]));

      expect(
          storeTester.state.featuredSpaces,
          List.generate(
            6,
            (index) => Space.randomSpace(labNumber: index),
          ));

      storeTester.dispatch(SearchSpacesAction(searchText: 'blabla...'));
      await storeTester.waitUntil(SearchSpacesAction);

      expect(
        storeTester.lastInfo.state.featuredSpaces,
        List.generate(
          6,
          (index) => Space.randomSpace(labNumber: index),
        ),
      );
      verify(mockApi.filterSpaces(FilterCriteria()));
    });
  });
}
