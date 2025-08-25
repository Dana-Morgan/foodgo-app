import 'package:get_it/get_it.dart';
import 'api/dio.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<DioApi>(() => DioApi());
}
