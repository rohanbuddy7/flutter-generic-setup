library get_it;

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/ui/home/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../network/rest_client.dart';
import '../repository/home_repository.dart';
import '../utils/enviroment.dart';
import '../utils/shared_pref.dart';

final getIt = GetIt.instance;

void diSetup() {
  ///register singleton class
  getIt.registerSingleton<SharedPref>(SharedPref());

  Dio dio = Dio();
  dio.interceptors.add(NullQueryParamRemoverInterceptor());
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (logVal) => print(logVal),
    ),
  );
  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<RestClient>(
      RestClient(getIt(), baseUrl: Environment().config.baseUrl));

  ///repository
  getIt.registerLazySingleton<IHomeRepository>(
      () => HomeRepository(restClient: getIt<RestClient>()));

  ///blocs/cubit
  getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(iHomeRepository: getIt<IHomeRepository>()));

}
