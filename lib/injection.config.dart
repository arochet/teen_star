// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i5;

import 'INFRASTRUCTURE/auth/auth_repository.dart' as _i3;
import 'INFRASTRUCTURE/cycle/cycle_repository.dart' as _i4;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthRepository>(
    () => _i3.FirebaseAuthFacade(),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.lazySingleton<_i4.ICycleRepository>(
      () => _i4.CycleRepository(get<_i5.Database>()));
  return get;
}
