import 'package:flutter/material.dart';
import 'package:seeing_beyond/core/test_data/model/color_data_model.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_scan_result_model.dart';

abstract class ColorScannerRepository {
  Future<List<ColorDataModel>> getColorDataModel();
  ColorScanResultModel getColorScanResult({
    required List<ColorDataModel> data,
    required Color dominantColor,
  });
}
