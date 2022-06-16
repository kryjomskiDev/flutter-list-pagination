import 'package:flutter/material.dart';

abstract class MockColorRepository {
  Future<List<Color>> getColorsList(int lenght);
}
