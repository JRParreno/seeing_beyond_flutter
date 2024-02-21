part of 'color_scanner_bloc.dart';

abstract class ColorScannerEvent extends Equatable {
  const ColorScannerEvent();

  @override
  List<Object> get props => [];
}

class OnGetScanResult extends ColorScannerEvent {
  final Color color;
  final bool isScanner;

  const OnGetScanResult({
    required this.color,
    required this.isScanner,
  });

  @override
  List<Object> get props => [
        color,
        isScanner,
      ];
}

class ColorScannerReset extends ColorScannerEvent {}

class OnLoadingColorScanner extends ColorScannerEvent {}

class OnColorErrorEvent extends ColorScannerEvent {}
