import 'dart:math';

import 'package:injectable/injectable.dart';

@module
abstract class RandomGeneratorInjectable {
  @lazySingleton
  Random getRandomGenerator() => Random();
}
