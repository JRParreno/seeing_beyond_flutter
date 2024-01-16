import 'package:seeing_beyond/src/color_vision_test/domain/entities/color_test.dart';

class ColorResultModel extends ColorTest {
  final double percentage;
  final bool isDifficulty;

  const ColorResultModel({
    required super.colorName,
    required super.colorCode,
    required this.percentage,
    this.isDifficulty = false,
  });

  @override
  List<Object?> get props => [
        colorName,
        colorCode,
        percentage,
        isDifficulty,
      ];

  factory ColorResultModel.iniColor(String name) {
    return ColorResultModel(
      colorCode: '',
      colorName: name,
      percentage: 0,
    );
  }

  ColorResultModel copyWith({
    double? percentage,
    bool? isDifficulty,
    String? colorName,
    String? colorCode,
  }) {
    return ColorResultModel(
      percentage: percentage ?? this.percentage,
      isDifficulty: isDifficulty ?? this.isDifficulty,
      colorCode: colorCode ?? this.colorCode,
      colorName: colorName ?? this.colorName,
    );
  }
}
