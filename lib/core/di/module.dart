import 'package:front_project/core/network/api_services.dart';
import 'package:front_project/core/network/dio_config.dart';
import 'package:front_project/features/auth/data/datasource/remote/remote_login_ds.dart';
import 'package:front_project/features/auth/domain/repository/auth_repo.dart';
import 'package:front_project/features/auth/domain/use_case/get_login_state_use_case.dart';
import 'package:front_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:front_project/features/auth/domain/use_case/set_login_state_use_case.dart';
import 'package:front_project/features/auth/presentation/cubit/login_cubit.dart';
import 'package:front_project/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<ApiServices>(ApiServices(DioConfig.instance.dio));
  getIt.registerFactory<RemoteLoginDataSource>(
    () => RemoteLoginDataSourceImpl(getIt<ApiServices>()),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt<RemoteLoginDataSource>()),
  );
  getIt.registerFactory(() => LoginUseCase(getIt<AuthRepo>()));
  getIt.registerFactory(() => SetLoginStateUseCase(getIt<AuthRepo>()));
  getIt.registerFactory(() => GetLoginStateUseCase(getIt<AuthRepo>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginUseCase>(), getIt<SetLoginStateUseCase>()));
  getIt.registerFactory<SplashCubit>(() => SplashCubit(getIt<GetLoginStateUseCase>()));
}
