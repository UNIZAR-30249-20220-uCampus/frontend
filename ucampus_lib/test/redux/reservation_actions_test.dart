import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/payment.dart';
import 'package:ucampus_lib/core/models/timetable.dart';
import 'package:ucampus_lib/core/redux/actions/loading_actions.dart';
import 'package:ucampus_lib/core/redux/actions/reservation_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/locator.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  var storeTester;
  var mockApi;

  bool originalisLoading = false;

  setUp(() {
    storeTester = StoreTester<AppState>(
        initialState: AppState.initialState().copy(
          isLoading: originalisLoading,
        ),
        shouldThrowUserExceptions: false);
    mockApi = MockApiService();
    locator.registerSingleton<ApiService>(mockApi);
  });

  setUpAll(() {
    setupLocator();
    locator.allowReassignment = true;
  });

  group('ReservationAction', () {
    test('should not return exception', () async {
      Timetable timetable = Timetable.randomTimetable();
      when(mockApi.makeReservation(timetable, '1', false, '1'))
          .thenAnswer((_) => Future.value(ReservationResult.success));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(ReservationAction(
          time: timetable, spaceID: '1', isForRent: false, userID: '1'));

      TestInfo info = await storeTester
          .waitAllGetLast([ReservationAction], ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.makeReservation(timetable, '1', false, '1'));
      expect(info.errors, []);
    });

    test('should return exception', () async {
      Timetable timetable = Timetable.randomTimetable();
      when(mockApi.makeReservation(timetable, '1', false, '1'))
          .thenAnswer((_) => Future.value(ReservationResult.error));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(ReservationAction(
          time: timetable, spaceID: '1', isForRent: false, userID: '1'));
      TestInfo info = await storeTester
          .waitAllGetLast([ReservationAction], ignore: [SetLoadingAction]);

      expect(
          info.errors.removeFirst().msg, "La reserva no ha podido realizarse.");
      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.makeReservation(timetable, '1', false, '1'));
    });
  });

  group('CancelReservationAction', () {
    test('should not return exception', () async {
      when(mockApi.cancelReservation(1))
          .thenAnswer((_) => Future.value(CancelReservationResult.success));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(CancelReservationAction(reservationID: 1));

      TestInfo info = await storeTester.waitAllGetLast([CancelReservationAction],
          ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.cancelReservation(1));
      expect(info.errors, []);
    });

    test('should return exception', () async {
      when(mockApi.cancelReservation(1))
          .thenAnswer((_) => Future.value(CancelReservationResult.error));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(CancelReservationAction(reservationID: 1));
      TestInfo info = await storeTester.waitAllGetLast(
          [CancelReservationAction],
          ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.cancelReservation(1));
      expect(
          info.errors.removeFirst().msg, "La reserva no ha podido cancelarse.");
    });
  });

  group('AcceptReservationAction', () {
    test('should not return exception', () async {
      when(mockApi.acceptReservation(1))
          .thenAnswer((_) => Future.value(AcceptReservationResult.success));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(AcceptReservationAction(reservationID: 1));
      TestInfo info = await storeTester.waitAllGetLast([AcceptReservationAction],
          ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.acceptReservation(1));
      expect(info.errors, []);
    });

    test('should return exception', () async {
      when(mockApi.acceptReservation(1))
          .thenAnswer((_) => Future.value(AcceptReservationResult.error));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester.dispatch(AcceptReservationAction(reservationID: 1));
      TestInfo info = await storeTester.waitAllGetLast(
          [AcceptReservationAction],
          ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.acceptReservation(1));
      expect(
          info.errors.removeFirst().msg, "La reserva no ha podido aceptarse.");
    });
  });

  group('PayReservationAction', () {
    test('should not return exception', () async {
      Payment payment = new Payment();
      when(mockApi.paymentReservation(1, payment))
          .thenAnswer((_) => Future.value(PaymentReservationResult.success));

      expect(storeTester.state.isLoading, originalisLoading);

       storeTester
          .dispatch(PayReservationAction(reservationID: 1, payment: payment));
      TestInfo info = await storeTester
          .waitAllGetLast([PayReservationAction], ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.paymentReservation(1, payment));
      expect(info.errors, []);
    });

    test('should return exception', () async {
      Payment payment = new Payment();
      when(mockApi.paymentReservation(1, payment))
          .thenAnswer((_) => Future.value(PaymentReservationResult.error));

      expect(storeTester.state.isLoading, originalisLoading);

      storeTester
          .dispatch(PayReservationAction(reservationID: 1, payment: payment));
      TestInfo info = await storeTester
          .waitAllGetLast([PayReservationAction], ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.paymentReservation(1, payment));
      expect(info.errors.removeFirst().msg, "El pago no ha podido realizarse.");
    });
  });

  group('EditBookableLeasableAction', () {
    test('should not return exception', () async {
      when(mockApi.updateBookable('1', true))
          .thenAnswer((_) => Future.value(UpdateBookableResult.success));

      when(mockApi.updateLeasable('1', true))
          .thenAnswer((_) => Future.value(UpdateBookableResult.success));

      expect(storeTester.state.isLoading, originalisLoading);

       storeTester.dispatch(EditBookableLeasableAction(
          space: '1', bookable: true, leasable: true));
      TestInfo info = await storeTester.waitAllGetLast([EditBookableLeasableAction],
          ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.updateBookable('1', true));
      verify(mockApi.updateLeasable('1', true));
      expect(info.errors, []);
    });

    test('should return exception', () async {
      when(mockApi.updateBookable('1', true))
          .thenAnswer((_) => Future.value(UpdateBookableResult.error));

      when(mockApi.updateLeasable('1', true))
          .thenAnswer((_) => Future.value(UpdateBookableResult.error));

      expect(storeTester.state.isLoading, originalisLoading);

 storeTester.dispatch(EditBookableLeasableAction(
          space: '1', bookable: true, leasable: true));
      TestInfo info = await storeTester.waitAllGetLast(
          [EditBookableLeasableAction],
          ignore: [SetLoadingAction]);

      expect(storeTester.state.isLoading, originalisLoading);
      verify(mockApi.updateBookable('1', true));
      verify(mockApi.updateLeasable('1', true));
      expect(info.errors.removeFirst().msg,
          "El espacio no ha podido actualizarse.");
    });
  });
}
