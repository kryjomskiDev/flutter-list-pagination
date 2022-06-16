import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:list_pagination/domain/mock_color_repository.dart';

@injectable
class GetColorsListUseCase {
  final MockColorRepository _mockColorRepository;
  const GetColorsListUseCase(this._mockColorRepository);

  Future<List<Color>> call(int len) => _mockColorRepository.getColorsList(len);
}
