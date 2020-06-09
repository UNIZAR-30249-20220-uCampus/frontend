import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/redux/actions/edit_equipment_actions.dart';
import 'package:ucampus_lib/core/redux/actions/loading_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/locator.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  var storeTester;
  var mockApi;

   List<Equipment>  originalEquipments = List.generate(
    3,
    (index) => Equipment.randomEquipment(),
  );
  bool originalisLoading = false;

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        isLoading: originalisLoading,
      ),
      shouldThrowUserExceptions: false
    );
    mockApi = MockApiService();
    locator.registerSingleton<ApiService>(mockApi);
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('EditEquipmentAction', () {
    test('should not return exception',
        () async {
      
      when(mockApi.updateEquipment('1', originalEquipments))
          .thenAnswer((_) => Future.value(UpdateEquipmentResult.success));
      
      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(EditEquipmentAction(newEquipment: originalEquipments, spaceID: '1'));
      TestInfo info = await storeTester
          .waitAllGetLast([EditEquipmentAction], ignore: [SetLoadingAction]);
      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.updateEquipment('1', originalEquipments));
      expect(info.errors, []);
    });

    test('should return exception',
        () async {
      
      when(mockApi.updateEquipment('1', originalEquipments))
          .thenAnswer((_) => Future.value(UpdateEquipmentResult.error));
      
      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(EditEquipmentAction(newEquipment: originalEquipments, spaceID: '1'));
      TestInfo info = await storeTester
          .waitAllGetLast([EditEquipmentAction], ignore: [SetLoadingAction]);
      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.updateEquipment('1', originalEquipments));
      expect(info.errors.removeFirst().msg, "El equipamiento no ha podido actualizarse.");
    });
  });
}
