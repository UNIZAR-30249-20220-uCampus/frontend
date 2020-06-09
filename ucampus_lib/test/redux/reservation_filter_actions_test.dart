import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/models/filter_criteria.dart';
import 'package:ucampus_lib/core/models/reservation.dart';
import 'package:ucampus_lib/core/models/space.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/filter_actions.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_filter_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/locator.dart';

void main() {
  var storeTester;
   List<ReservationStatus> originalCriteria = [ReservationStatus.PENDIENTE, ReservationStatus.ACEPTADA];

  setUp(() {
    storeTester = StoreTester<AppState>(
      initialState: AppState.initialState().copy(
        reservationFilterCriteria: originalCriteria,
      ),
    );
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('ReservationFilterCriteriaActions', () {
    group('AddReservationFilterCriteriaAction', () {
      test('should add new criteria', () async {
        expect(storeTester.state.reservationFilterCriteria, originalCriteria);
        storeTester.dispatch(
          AddReservationFilterCriteriaAction(reservationFilterCriteria: [ReservationStatus.CANCELADA]),
        );
        await storeTester.wait(AddReservationFilterCriteriaAction);
        expect(
            storeTester.state.reservationFilterCriteria,
            [ReservationStatus.CANCELADA]);
      });
    });


  });
}
