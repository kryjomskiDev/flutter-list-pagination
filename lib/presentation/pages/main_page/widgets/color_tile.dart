import 'package:flutter/material.dart';
import 'package:list_pagination/styles/dimens.dart';

class ColorTile extends StatelessWidget {
  final Color color;
  const ColorTile({required this.color, super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: Dimens.colorTileSize,
        width: double.infinity,
        color: color,
      );
}
