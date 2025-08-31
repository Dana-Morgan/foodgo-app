import 'package:dio/dio.dart';
import 'package:foodgo/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'api/dio.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: "https://foodgo-sable.vercel.app")),
  );
  locator.registerLazySingleton<DioApi>(() => DioApi(locator<Dio>()));
  locator.registerLazySingleton<ProductRepository>(
        () => ProductRepository(locator<DioApi>()),
  );
}
