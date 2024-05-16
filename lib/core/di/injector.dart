import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/network_info.dart';
import 'package:posts_app/layers/data/app_repository_impl.dart';
import 'package:posts_app/layers/data/source/local/hive_manager.dart';
import 'package:posts_app/layers/data/source/local/local_storage.dart';
import 'package:posts_app/layers/data/source/remote/app_api.dart';
import 'package:posts_app/layers/data/source/remote/dio_factory.dart';
import 'package:posts_app/layers/domain/repository/app_repository.dart';
import 'package:posts_app/layers/domain/usecase/posts/posts_usecase.dart';
import 'package:posts_app/layers/presentation/pages/home/controller/home_cubit.dart';
import 'package:posts_app/layers/presentation/pages/home_tabs/posts/controller/posts_cubit.dart';

GetIt getIt = GetIt.instance;

Future<void> initializeGetIt() async {
  // ---------------------------------------------------------------------------
  // DATA Layer
  // ---------------------------------------------------------------------------
  // NetworkInfo
  getIt
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()),
    )
    ..registerFactory<LocalStorage>(
      () => LocalStorageImpl(
        hiveBox: HiveManager.instance.database,
      ),
    )
    // dio factory
    ..registerLazySingleton<DioFactory>(() => DioFactory(getIt()));

  final dio = await getIt<DioFactory>().getDio();
  //app service client
  getIt
    ..registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio))

    // getIt.registerLazySingleton<Api>(() => ApiImpl());

    ..registerFactory<AppRepository>(
      () => AppRepositoryImpl(
        api: getIt(),
        localStorage: getIt(),
        networkInfo: getIt(),
      ),
    )

    // ---------------------------------------------------------------------------
    // DOMAIN Layer
    // ---------------------------------------------------------------------------

    ..registerFactory(
      () => PostsUseCase(
        repository: getIt(),
      ),
    )

    // // ---------------------------------------------------------------------------
    // // PRESENTATION Layer
    // // ---------------------------------------------------------------------------
    ..registerFactory(
      HomeCubit.new,
    )
    ..registerFactory(
      () => PostsCubit(getIt()),
    );
}
