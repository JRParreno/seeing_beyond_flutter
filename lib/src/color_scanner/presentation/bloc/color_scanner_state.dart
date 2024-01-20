part of 'color_scanner_bloc.dart';

abstract class ColorScannerState extends Equatable {
  const ColorScannerState();

  @override
  List<Object> get props => [];
}

class ColorScannerInitial extends ColorScannerState {}

class ColorScannerLoading extends ColorScannerState {}

class ColorScannerLoaded extends ColorScannerState {
  final ColorScanResultModel result;

  const ColorScannerLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class ColorScannerErrorState extends ColorScannerState {}
