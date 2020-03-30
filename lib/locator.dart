import 'package:get_it/get_it.dart';
import 'package:ucampus/core/services/api_service.dart';
import 'package:ucampus/core/services/fake_api.dart';
import 'package:ucampus/core/services/http_api.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(
      () => USE_FAKE_IMPLEMENTATION ? FakeApi() : HttpApi());
}
