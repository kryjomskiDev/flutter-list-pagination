// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:math' as _i3;

import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/mock_color_repostiory_impl.dart' as _i6;
import '../domain/get_colors_list_use_case.dart' as _i7;
import '../domain/mock_color_repository.dart' as _i5;
import '../presentation/pages/main_page/cubit/main_page_cubit.dart' as _i8;
import 'random/random_injectable.dart' as _i9;
import 'scroll_controller/scroll_controller_injectable.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final randomGeneratorInjectable = _$RandomGeneratorInjectable();
  final scrollControllerInjectable = _$ScrollControllerInjectable();
  gh.lazySingleton<_i3.Random>(
      () => randomGeneratorInjectable.getRandomGenerator());
  gh.lazySingleton<_i4.ScrollController>(
      () => scrollControllerInjectable.getController());
  gh.lazySingleton<_i5.MockColorRepository>(
      () => _i6.MockColorRepositoryImpl(get<_i3.Random>()));
  gh.factory<_i7.GetColorsListUseCase>(
      () => _i7.GetColorsListUseCase(get<_i5.MockColorRepository>()));
  gh.factory<_i8.MainPageCubit>(() => _i8.MainPageCubit(
      get<_i7.GetColorsListUseCase>(), get<_i4.ScrollController>()));
  return get;
}

class _$RandomGeneratorInjectable extends _i9.RandomGeneratorInjectable {}

class _$ScrollControllerInjectable extends _i10.ScrollControllerInjectable {}
