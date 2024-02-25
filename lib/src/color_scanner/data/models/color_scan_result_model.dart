import 'package:equatable/equatable.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_near.dart';
import 'package:seeing_beyond/src/color_vision_test/domain/entities/color_test.dart';

class ColorScanResultModel extends Equatable {
  final ColorTest? exactColor;
  final List<ColorNear> nearColors;

  const ColorScanResultModel({
    required this.nearColors,
    this.exactColor,
  });

  factory ColorScanResultModel.empty() {
    return const ColorScanResultModel(
      nearColors: [],
    );
  }

  @override
  List<Object?> get props => [
        exactColor,
        nearColors,
      ];
}
