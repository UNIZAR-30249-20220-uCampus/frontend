import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/locator.dart';

void main() {
  var storeTester;
  FilterCriteria originalCritera = FilterCriteria(
    activeCriteria: [CriteriaKind.NAME, CriteriaKind.CAPACITY],
    name: '1.02',
    kinds: <SpaceKind>[],
    equipments: <Equipment>[],
    capacity: 20,
    timetable: Timetable()
  );

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        filterCriteria: originalCritera,
      ),
    );
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('FilterCriteriaActions', () {
    group('AddFilterCriteriaAction', () {
      test('should add new criteria if not present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(
          AddFilterCriteriaAction(criteriaKind: CriteriaKind.EQUIPMENT),
        );
        await storeTester.wait(AddFilterCriteriaAction);
        expect(
            storeTester.state.filterCriteria,
            originalCritera.copy(activeCriteria: [
              CriteriaKind.NAME,
              CriteriaKind.CAPACITY,
              CriteriaKind.EQUIPMENT,
            ]));
      });
      test('should not add new criteria if present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(
          AddFilterCriteriaAction(criteriaKind: CriteriaKind.NAME),
        );
        await storeTester.wait(AddFilterCriteriaAction);
        expect(storeTester.state.filterCriteria, originalCritera);
      });
    });

    group('RemoveFilterCriteriaAction', () {
      test('should remove criteria only if present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(
            RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.NAME));
        await storeTester.wait(RemoveFilterCriteriaAction);
        expect(
          storeTester.state.filterCriteria,
          originalCritera.copy(activeCriteria: [CriteriaKind.CAPACITY]),
        );
      });
      test('should not remove criteria if not present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(
            RemoveFilterCriteriaAction(criteriaKind: CriteriaKind.EQUIPMENT));
        await storeTester.wait(RemoveFilterCriteriaAction);
        expect(storeTester.state.filterCriteria, originalCritera);
      });
    });
    group('CleanFilterCriteriaAction', () {
      test('should remove all criteria', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(CleanFilterCriteriaAction());
        await storeTester.wait(CleanFilterCriteriaAction);
        expect(storeTester.state.filterCriteria, FilterCriteria.cleanCritera());
      });
    });

    group('SetFilterValueAction', () {
      test('should set filter value when present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(SetFilterValueAction(
            criteriaKind: CriteriaKind.CAPACITY, value: 40));
        await storeTester.wait(SetFilterValueAction);
        expect(storeTester.state.filterCriteria,
            originalCritera.copy(capacity: 40));
      });
      test('should not set filter value when present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(SetFilterValueAction(
          criteriaKind: CriteriaKind.EQUIPMENT,
          value: [
            Equipment(
              equipmentKind: EquipmentKind.CHAIR,
              amount: 10,
            ),
          ],
        ));
        await storeTester.wait(SetFilterValueAction);
        expect(storeTester.state.filterCriteria, originalCritera);
      });
    });
  });
}
