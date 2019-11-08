import 'package:get_it/get_it.dart';
import 'package:prac_arch_provider_filledstack/core/services/api.dart';
import 'package:prac_arch_provider_filledstack/core/services/auth_services.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/comments_model.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/home_model.dart';
import 'package:prac_arch_provider_filledstack/core/viewmodels/login_model.dart';
import 'package:prac_arch_provider_filledstack/ui/router.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  // router
  locator.registerLazySingleton(() => Router());

  // inject all services
  locator.registerLazySingleton(() => AuthServices());
  locator.registerLazySingleton(() => Api());

  // inject all viewModels
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}