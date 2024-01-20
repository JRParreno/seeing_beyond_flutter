import 'package:flutter/material.dart';

import 'package:seeing_beyond/core/utils/hex_to_colors.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_scan_result_model.dart';

class ColorScannerResultsCard extends StatelessWidget {
  const ColorScannerResultsCard({
    Key? key,
    required this.colorScanResultModel,
  }) : super(key: key);

  final ColorScanResultModel colorScanResultModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          final item = colorScanResultModel.nearColors[index];

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
                  '${getColorPercentage(item.nearValue).toStringAsFixed(2)}%',
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
