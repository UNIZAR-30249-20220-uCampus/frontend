import 'package:async_redux/async_redux.dart';
import 'package:test/test.dart';
import 'package:ucampus/core/models/equipment.dart';
import 'package:ucampus/core/models/filter_criteria.dart';
import 'package:ucampus/core/redux/actions/filter_actions.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/locator.dart';

void main() {
  var storeTester;
  FilterCriteria originalCritera = FilterCriteria(
    activeCriteria: [CriteriaKind.NAME, CriteriaKind.SURFACE],
    name: '1.02',
    kinds: [],
    equipments: <Equipment>[],
    capacity: null,
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
        storeTester.dispatch(SetFilterValueAction(
            criteriaKind: CriteriaKind.CAPACITY, value: 100));
        await storeTester.wait(SetFilterValueAction);
        expect(
            storeTester.state.filterCriteria,
            originalCritera.copy(activeCriteria: [
              CriteriaKind.NAME,
              CriteriaKind.SURFACE,
              CriteriaKind.CAPACITY
            ], capacity: 100));
      });
      test('should not add new criteria if present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(SetFilterValueAction(
            criteriaKind: CriteriaKind.NAME, value: 'blabla...'));
        await storeTester.wait(SetFilterValueAction);
        expect(storeTester.state.filterCriteria, originalCritera);
      });
    });

    group('RemoveFilterCriteriaAction', () {
      test('should remove criteria only if present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(
            AddFilterCriteriaAction(criteriaKind: CriteriaKind.NAME));
        await storeTester.wait(AddFilterCriteriaAction);
        expect(
          storeTester.state.filterCriteria,
          originalCritera
              .copy(activeCriteria: [CriteriaKind.SURFACE], name: null),
        );
      });
      test('should not remove criteria if not present', () async {
        expect(storeTester.state.filterCriteria, originalCritera);
        storeTester.dispatch(
            AddFilterCriteriaAction(criteriaKind: CriteriaKind.CAPACITY));
        await storeTester.wait(AddFilterCriteriaAction);
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
  });
}
