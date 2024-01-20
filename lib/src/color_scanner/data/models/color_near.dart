import 'package:seeing_beyond/src/color_vision_test/domain/entities/color_test.dart';

class ColorNear extends ColorTest {
  final double nearValue;

  const ColorNear({
    required super.colorName,
    required super.colorCode,
    required this.nearValue,
  });

  factory ColorNear.empty() {
    return const ColorNear(
      colorCode: '',
      colorName: '',
      nearValue: -1,
    );
  }

  @override
  List<Object?> get props => [
        colorName,
        colorCode,
        nearValue,
      ];
}
