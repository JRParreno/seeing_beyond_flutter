import 'package:flutter/material.dart';

import 'package:seeing_beyond/core/utils/hex_to_colors.dart';
import 'package:seeing_beyond/src/color_vision_test/data/models/color_result_model.dart';

class ColorResultsCard extends StatelessWidget {
  const ColorResultsCard({
    Key? key,
    required this.colorResultModel,
  }) : super(key: key);

  final List<ColorResultModel> colorResultModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: colorResultModel.length,
        itemBuilder: (context, index) {
          final item = colorResultModel[index];

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
                  item.percentage.toInt() == 100
                      ? '100%'
                      : '${item.percentage.toStringAsFixed(2)}%',
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
}
