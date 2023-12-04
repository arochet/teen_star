// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:sqflite/sqflite.dart' as _i5;
import 'package:teenstar/INFRASTRUCTURE/auth/auth_repository.dart' as _i3;
import 'package:teenstar/INFRASTRUCTURE/core/firebase_injectable_module.dart'
    as _i7;
import 'package:teenstar/INFRASTRUCTURE/cycle/cycle_repository.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.AuthRepository>(() => _i3.FirebaseAuthFacade());
    gh.lazySingleton<_i4.ICycleRepository>(
        () => _i4.CycleRepository(gh<_i5.Database>()));
    gh.lazySingletonAsync<_i6.SharedPreferences>(
        () => firebaseInjectableModule.sharedPreferences);
    return this;
  }
}

class _$FirebaseInjectableModule extends _i7.FirebaseInjectableModule {}
