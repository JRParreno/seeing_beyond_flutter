import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeing_beyond/src/color_scanner/data/models/color_scan_result_model.dart';
import 'package:seeing_beyond/src/color_scanner/domain/repositories/color_scanner_repository.dart';

part 'color_scanner_event.dart';
part 'color_scanner_state.dart';

class ColorScannerBloc extends Bloc<ColorScannerEvent, ColorScannerState> {
  final ColorScannerRepository colorScannerRepository;

  ColorScannerBloc(this.colorScannerRepository) : super(ColorScannerInitial()) {
    on<OnGetScanResult>(_onGetScanResult);
    on<ColorScannerReset>(_colorScannerReset);
    on<OnLoadingColorScanner>(_onLoadingColorScanner);
    on<OnColorErrorEvent>(_onColorErrorEvent);
  }

  void _onColorErrorEvent(
      OnColorErrorEvent event, Emitter<ColorScannerState> emit) {
    emit(ColorScannerErrorState());
  }

  void _colorScannerReset(
      ColorScannerReset event, Emitter<ColorScannerState> emit) {
    emit(ColorScannerInitial());
  }

  Future<void> _onGetScanResult(
      OnGetScanResult event, Emitter<ColorScannerState> emit) async {
    try {
      final dataColors = await colorScannerRepository.getColorDataModel();
      final result = colorScannerRepository.getColorScanResult(
        data: dataColors,
        dominantColor: event.color,
        isScanner: event.isScanner,
      );

      emit(ColorScannerLoaded(result));
    } catch (e) {
      emit(ColorScannerErrorState());
    }
  }

  void _onLoadingColorScanner(
      OnLoadingColorScanner event, Emitter<ColorScannerState> emit) {
    emit(ColorScannerLoading());
  }
}
