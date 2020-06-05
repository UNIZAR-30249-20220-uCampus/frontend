import 'package:get_it/get_it.dart';
import 'package:ucampus_lib/core/services/api_service.dart';
import 'package:ucampus_lib/core/services/fake_api.dart';
import 'package:ucampus_lib/core/services/http_api.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = false;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(
      () => USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi());
}
