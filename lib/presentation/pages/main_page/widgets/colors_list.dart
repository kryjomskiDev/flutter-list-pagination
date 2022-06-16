import 'package:flutter/material.dart';
import 'package:list_pagination/presentation/pages/main_page/widgets/color_tile.dart';
import 'package:list_pagination/presentation/widgets/app_loading_indicator.dart';

class ColorsList extends StatelessWidget {
  final bool isLoading;
  final List<Color> colors;
  final ScrollController controller;

  const ColorsList({
    required this.isLoading,
    required this.colors,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => ColorTile(color: colors[index]),
              itemCount: colors.length,
              controller: controller,
            ),
          ),
          if (isLoading) const AppLoadingIndicator(),
        ],
      );
}
