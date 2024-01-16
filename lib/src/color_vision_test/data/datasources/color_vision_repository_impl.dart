import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:seeing_beyond/core/test_data/model/color_data_model.dart';
import 'package:seeing_beyond/gen/assets.gen.dart';
import 'package:seeing_beyond/src/color_vision_test/data/models/color_result_model.dart';
import 'package:seeing_beyond/src/color_vision_test/domain/repositories/color_vision_repository.dart';

class ColorVisionRepositoryImpl extends ColorVisionRepository {
  @override
  Future<List<ColorDataModel>> shuffleColorTest() async {
    String data = await rootBundle.loadString(Assets.json.colorsData);
    final jsonResult = jsonDecode(data)['colors'] as List<dynamic>;

    final colorList = jsonResult
        .map(
          (e) => ColorDataModel.fromMap(e),
        )
        .toList();

    final generateColors = [
      ...colorList,
      ...colorList,
      ...colorList,
    ];
    generateColors.shuffle();

    return generateColors;
  }

  @override
  List<ColorResultModel> getResultColorVistionTest(
      List<ColorDataModel> colorDataModels) {
    colorDataModels.sort((a, b) => a.colorName.compareTo(b.colorName));

    throw UnimplementedError();
  }
}
