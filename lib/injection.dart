

import 'package:get_it/get_it.dart';
import 'package:ghp_app/application/news/news_bloc.dart';
import 'package:ghp_app/application/signin/signin_bloc.dart';
import 'package:ghp_app/domain/repositories/news_repository.dart';
import 'package:ghp_app/domain/repositories/signin_repository.dart';
import 'package:ghp_app/infrastructure/datasources/news_datasource.dart';
import 'package:ghp_app/infrastructure/datasources/signin_datasource.dart';
import 'package:ghp_app/infrastructure/repositories/news_repository_impl.dart';
import 'package:ghp_app/infrastructure/repositories/signin_repository_impl.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I;

Future<void> init() async {
  //Application
  sl.registerFactory(() => NewsBloc(newsRepository: sl()));
  sl.registerFactory(() => SigninBloc(signinRepository: sl()));

  //Repositories
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(newsDatasource: sl()));
  sl.registerLazySingleton<SigninRepository>(() => SigninRepositoryImpl(signinDatasource: sl()));

  //Datasource
  sl.registerLazySingleton<NewsDatasource>(() => NewsDatasourceImpl(client: sl()));
  sl.registerLazySingleton<SigninDatasource>(() => SigninDatasourceImpl(client: sl()));

  //extern
  sl.registerLazySingleton(() => http.Client());
}