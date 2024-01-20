import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:seeing_beyond/core/test_data/model/color_data_model.dart';
import 'package:seeing_beyond/core/utils/color_difference.dart';
import 'package:seeing_beyond/core/utils/hex_to_colors.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_near.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_scan_result_model.dart';
import 'package:seeing_beyond/src/color_scanner/domain/repositories/color_scanner_repository.dart';

class ColorScannerRepositoryImpl extends ColorScannerRepository {
  @override
  Future<List<ColorDataModel>> getColorDataModel() async {
    String data = await rootBundle.loadString(Assets.json.colorsData);
    final jsonResult = jsonDecode(data)['colors'] as List<dynamic>;

    final colorList = jsonResult
        .map(
          (e) => ColorDataModel.fromMap(e),
        )
        .toList();

    return colorList;
  }

  @override
  ColorScanResultModel getColorScanResult(
      {required List<ColorDataModel> data, required Color dominantColor}) {
    ColorScanResultModel tempResult = ColorScanResultModel.empty();
    final hexColor = dominantColor.toHexTriplet();
    List<ColorNear> nearColors = [];

    for (var i = 0; i < data.length; i++) {
      final colors = data[i];

      if (colors.colorCode.toLowerCase() == hexColor.toLowerCase()) {
        tempResult = ColorScanResultModel(
          nearColors: nearColors,
          exactColor: colors.colorCode,
        );
        break;
      }

      final nearFamilyColor = getNearColorFamily(
        colorDataModel: colors,
        hexColor: hexColor.toLowerCase(),
      );

      nearColors.add(nearFamilyColor);
    }

    nearColors.sort((a, b) => a.nearValue.compareTo(b.nearValue));

    return ColorScanResultModel(
      nearColors: nearColors,
      exactColor: tempResult.exactColor,
    );
  }

  ColorNear getNearColorFamily({
    required ColorDataModel colorDataModel,
    required String hexColor,
  }) {
    double nearValue = -1;

    for (var i = 0; i < colorDataModel.family.length; i++) {
      final element = colorDataModel.family[i];

      if (element.toLowerCase() == hexColor.toLowerCase()) {
        return ColorNear(
          colorName: colorDataModel.colorName,
          nearValue: 0,
          colorCode: colorDataModel.colorCode,
        );
      }

      final tempNearValue = similarValue(
        baseColor: Color(
          int.parse(
            element.replaceAll('#', '0xff'),
          ),
        ),
        fromImageColor: Color(
          int.parse(
            hexColor.replaceAll('#', '0xff'),
          ),
        ),
      );

      if (nearValue < 0) {
        nearValue = tempNearValue;
      } else {
        nearValue = tempNearValue < nearValue ? tempNearValue : nearValue;
      }
    }

    return ColorNear(
      colorName: colorDataModel.colorName,
      nearValue: nearValue,
      colorCode: colorDataModel.colorCode,
    );
  }
}
