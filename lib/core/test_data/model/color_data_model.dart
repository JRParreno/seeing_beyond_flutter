import 'dart:convert';

import 'package:seeing_beyond/src/color_vision_test/domain/entities/color_test.dart';

class ColorDataModel extends ColorTest {
  final List<String> family;
  final bool isCorrect;

  const ColorDataModel({
    required super.colorName,
    required super.colorCode,
    required this.family,
    this.isCorrect = false,
  });

  @override
  List<Object?> get props => [
        colorName,
        colorCode,
        family,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'family': family});

    return result;
  }

  factory ColorDataModel.fromMap(Map<String, dynamic> map) {
    return ColorDataModel(
      colorCode: map['colorCode'],
      colorName: map['colorName'],
      family: List<String>.from(map['family']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorDataModel.fromJson(String source) =>
      ColorDataModel.fromMap(json.decode(source));

  ColorDataModel copyWith({
    List<String>? family,
    bool? isCorrect,
    String? colorName,
    String? colorCode,
  }) {
    return ColorDataModel(
      colorName: colorName ?? this.colorName,
      colorCode: colorCode ?? this.colorCode,
      family: family ?? this.family,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}
