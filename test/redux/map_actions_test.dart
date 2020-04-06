import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:latlong/latlong.dart';
import 'package:ucampus/core/models/space.dart';
import 'package:ucampus/core/redux/actions/map_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:ucampus/locator.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  var storeTester;
  var mockApi;

  List<Space> originalSpaces = List.generate(
    6,
    (index) => Space.randomSpace(labNumber: index),
  );

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        featuredSpaces: originalSpaces,
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
      Space singleSpace = Space.randomSpace();
      when(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)))
          .thenAnswer((_) => Future.value(singleSpace));

      expect(storeTester.state.featuredSpaces, originalSpaces);

      storeTester.dispatch(SpaceTapAction(tappedPosition: LatLng(42.0, 1.0)));
      await storeTester.wait(SpaceTapAction);

      expect(storeTester.lastInfo.state.featuredSpaces, [singleSpace]);
      verify(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)));
    });

    test('should keep featured spaces when tapped on an invalid space',
        () async {
      when(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)))
          .thenAnswer((_) => Future.value(null));

      expect(storeTester.state.featuredSpaces, originalSpaces);

      storeTester.dispatch(SpaceTapAction(tappedPosition: LatLng(42.0, 1.0)));
      await storeTester.wait(SpaceTapAction);

      expect(storeTester.lastInfo.state.featuredSpaces, originalSpaces);
      verify(mockApi.getSpaceInformation(0, LatLng(42.0, 1.0)));
    });
  });

  group('SearchSpacesAction', () {
    test('should feature spaces when there is a match', () async {
      List<Space> foundSpaces =
          List.generate(3, (index) => Space.randomSpace(labNumber: index));
      when(mockApi.filterSpaces(any))
          .thenAnswer((_) => Future.value(foundSpaces));

      expect(storeTester.state.featuredSpaces, originalSpaces);

      storeTester.dispatch(SearchSpacesAction(searchText: 'blabla...'));
      await storeTester.waitUntil(SearchSpacesAction);

      expect(storeTester.lastInfo.state.featuredSpaces, foundSpaces);
      verify(mockApi.filterSpaces(any));
    });

    test('should keep featured spaces when there are no matches', () async {
      when(mockApi.filterSpaces(any))
          .thenAnswer((_) => Future.value(<Space>[]));

      expect(storeTester.state.featuredSpaces, originalSpaces);

      storeTester.dispatch(SearchSpacesAction(searchText: 'blabla...'));
      await storeTester.waitUntil(SearchSpacesAction);

      expect(storeTester.lastInfo.state.featuredSpaces, originalSpaces);
      verify(mockApi.filterSpaces(any));
    });
  });
}
