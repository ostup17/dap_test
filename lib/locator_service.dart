import 'package:dap_test/features/data/datasources/all_news_local_data_source.dart';
import 'package:dap_test/features/data/datasources/all_news_remote_data_source.dart';
import 'package:dap_test/features/domain/repostiroy/all_news_repository.dart';
import 'package:dap_test/features/domain/usescases/get_all_news.dart';
import 'package:dap_test/features/presentation/all_news_cubit/all_news_list_cubit.dart';
import 'package:dap_test/features/repositories/all_news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/platform/network_info.dart';

final sl = GetIt.instance;

//registration
Future<void> init() async {

  //Cubit
  sl.registerFactory(() => AllNewsListCubit(getAllNews: sl()));


  //UseCases
  sl.registerLazySingleton(() => GetAllNews(sl()));


  //Repository
  sl.registerLazySingleton<AllNewsRepository>(() => AllNewsRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl()
  ));



  sl.registerLazySingleton<AllNewsRemoteDataSource>(() => AllNewsRemoteDataSourceImpl(
    client: http.Client(),
  ));


  sl.registerLazySingleton<AllNewsLocalDataSource>(() => AllNewsLocalDataSourceImpl(
      sharedPreferences: sl()
  ));


  //Core
  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(connectionChecker: sl())
  );

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

