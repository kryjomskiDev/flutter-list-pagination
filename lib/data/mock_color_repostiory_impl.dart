import 'dart:math';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:list_pagination/domain/mock_color_repository.dart';

const duration = Duration(seconds: 5);

@LazySingleton(as: MockColorRepository)
class MockColorRepositoryImpl implements MockColorRepository {
  final Random _randomGenerator;
  const MockColorRepositoryImpl(this._randomGenerator);

  @override
  Future<List<Color>> getColorsList(int lenght) async {
    final colors = <Color>[];

    for (int i = 0; i < lenght; i++) {
      final randomColor = Colors.primaries[_randomGenerator.nextInt(Colors.primaries.length)];
      colors.add(randomColor);
    }

    await Future.delayed(duration);

    return Future.value(colors);
  }
}
