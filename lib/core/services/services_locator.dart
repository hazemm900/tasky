import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky/features/upload/data/apis/api_list.dart';
import 'package:tasky/features/upload/data/repo/list_repo.dart';
import 'package:tasky/features/upload/logic/list_cubit/list_cubit.dart';

import '../../features/auth/data/apis/api_auth.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/logic/auth_cubit.dart';
import '../networking/dio_factory.dart';


final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // تسجيل Dio
  // الحصول على SharedPreferences وتسجيل SharedPrefHelper

  Dio dio = DioFactory.getDio();


  ///========= Auth cubit ==========///
  getIt.registerFactory(() => AuthCubit(getIt()));
  getIt.registerFactory(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<AuthWebServices>(() => AuthWebServices(dio));

  ///========= List cubit ==========///
  getIt.registerFactory(() => ListCubit(getIt()));
  getIt.registerFactory(() => ListRepo(getIt()));
  getIt.registerLazySingleton<ListWebServices>(() => ListWebServices(dio));
}
