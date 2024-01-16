import 'package:equatable/equatable.dart';

class ColorTest extends Equatable {
  final String colorName;
  final String colorCode;

  const ColorTest({
    required this.colorName,
    required this.colorCode,
  });

  @override
  List<Object?> get props => [
        colorName,
        colorCode,
      ];
}
