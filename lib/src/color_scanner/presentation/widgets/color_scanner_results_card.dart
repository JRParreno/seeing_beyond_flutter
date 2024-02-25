import 'package:flutter/material.dart';

import 'package:seeing_beyond/core/utils/hex_to_colors.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_near.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_scan_result_model.dart';
import 'package:seeing_beyond/src/color_vision_test/domain/entities/color_test.dart';

class ColorScannerResultsCard extends StatelessWidget {
  const ColorScannerResultsCard({
    Key? key,
    required this.colorScanResultModel,
    this.exactColor,
  }) : super(key: key);

  final ColorScanResultModel colorScanResultModel;
  final ColorTest? exactColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          final item = exactColor != null
              ? ColorNear(
                  colorName: exactColor!.colorName,
                  colorCode: exactColor!.colorCode,
                  nearValue: 0)
              : colorScanResultModel.nearColors[index];

          if (exactColor != null) {}

          return Container(
            color: hexToColors(item.colorCode),
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.colorName.toUpperCase(),
                  style: TextStyle(
                    color: item.colorName == 'yellow'
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                Text(
                  '${exactColor != null ? "100" : getColorPercentage(item.nearValue).toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: item.colorName == 'yellow'
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  double getColorPercentage(double value) {
    return (255 - value) / 255 * 100;
  }
}
