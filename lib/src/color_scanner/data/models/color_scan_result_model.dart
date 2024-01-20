import 'package:equatable/equatable.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_near.dart';

class ColorScanResultModel extends Equatable {
  final String? exactColor;
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
