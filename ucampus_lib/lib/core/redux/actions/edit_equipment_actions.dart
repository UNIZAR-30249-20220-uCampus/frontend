import 'package:meta/meta.dart';
import 'package:async_redux/async_redux.dart';
import 'package:ucampus_lib/core/models/equipment.dart';
import 'package:ucampus_lib/core/redux/actions/loading_actions.dart';
import 'package:ucampus_lib/core/redux/app_state.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/locator.dart';

class EditEquipmentAction extends ReduxAction<AppState> {
  final List<Equipment> newEquipment;
  final String spaceID;

  EditEquipmentAction({@required this.newEquipment, @required this.spaceID});

  @override
  Future<AppState> reduce() async {
    dispatch(SetLoadingAction(isLoading: true));
    ApiService apiService = locator<ApiService>();
    UpdateEquipmentResult reservationResult = await apiService.updateEquipment(
      this.spaceID,
      this.newEquipment,
    );

    if (reservationResult == UpdateEquipmentResult.error) {
      return state; //TODO: mostrar algún tipo de pop up informando
    } else if (reservationResult == UpdateEquipmentResult.success) {
      return state; //TODO: mostrar algún tipo de pop up informando
    } else {
      return null;
    }
  }

  @override
  void after() => dispatch(SetLoadingAction(isLoading: false));
}
