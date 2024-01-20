part of 'color_scanner_bloc.dart';

abstract class ColorScannerEvent extends Equatable {
  const ColorScannerEvent();

  @override
  List<Object> get props => [];
}

class OnGetScanResult extends ColorScannerEvent {
  final Color color;
  const OnGetScanResult({
    required this.color,
  });

  @override
  List<Object> get props => [
        color,
      ];
}

class ColorScannerReset extends ColorScannerEvent {}

class OnLoadingColorScanner extends ColorScannerEvent {}

class OnColorErrorEvent extends ColorScannerEvent {}
