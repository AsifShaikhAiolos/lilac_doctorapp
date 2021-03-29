import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lilac_doctorapp/provider/auth_provider.dart';
import 'package:lilac_doctorapp/provider/dashboard_provider.dart';
import 'package:lilac_doctorapp/provider/repository/dashboard_repository.dart';
import 'package:lilac_doctorapp/utils/urls_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/dio_client.dart';
import 'data/logging_interceptor.dart';
import 'provider/repository/auth_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(UrlsClass.Base_URl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo( sl(), sl()));
  sl.registerLazySingleton(() => DashboardRepo( sl(), sl()));

  // Provider
  sl.registerFactory(() => AuthProvider( sl()));
  sl.registerFactory(() => DashboardProvider( sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

}
