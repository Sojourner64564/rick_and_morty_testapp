// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/common_feature/data/remote_ds/retrofit_remote_client.dart'
    as _i198;
import '../../features/main_screen_feature/data/repository_impl/fetch_characters_repository_impl.dart'
    as _i733;
import '../../features/main_screen_feature/domain/repository/fetch_characters_repository.dart'
    as _i475;
import '../../features/main_screen_feature/domain/usecase/fetch_characters_uc.dart'
    as _i293;
import '../../features/main_screen_feature/presentation/controller/fetch_characters_cubit/fetch_characters_cubit.dart'
    as _i860;
import '../network/internet_connection_checker.dart' as _i657;
import '../network/network_info.dart' as _i932;
import '../network/network_info_impl.dart' as _i865;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModuleConnectionChecker = _$RegisterModuleConnectionChecker();
  gh.factory<_i198.RetrofitRemoteClientInstance>(
      () => _i198.RetrofitRemoteClientInstance());
  gh.factory<_i973.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i932.NetworkInfo>(
      () => _i865.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.lazySingleton<_i475.FetchCharactersRepository>(
      () => _i733.FetchCharactersRepositoryImpl(
            gh<_i198.RetrofitRemoteClientInstance>(),
            gh<_i932.NetworkInfo>(),
          ));
  gh.lazySingleton<_i293.FetchCharactersUC>(
      () => _i293.FetchCharactersUC(gh<_i475.FetchCharactersRepository>()));
  gh.lazySingleton<_i860.FetchCharactersCubit>(
      () => _i860.FetchCharactersCubit(gh<_i293.FetchCharactersUC>()));
  return getIt;
}

class _$RegisterModuleConnectionChecker
    extends _i657.RegisterModuleConnectionChecker {}
