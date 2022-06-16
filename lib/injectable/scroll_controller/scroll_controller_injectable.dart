import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ScrollControllerInjectable {
  @lazySingleton
  ScrollController getController() => ScrollController();
}
