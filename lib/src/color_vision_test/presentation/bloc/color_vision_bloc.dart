import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeing_beyond/core/test_data/model/color_data_model.dart';
import 'package:seeing_beyond/src/color_vision_test/data/models/color_result_model.dart';
import 'package:seeing_beyond/src/color_vision_test/domain/repositories/color_vision_repository.dart';

part 'color_vision_event.dart';
part 'color_vision_state.dart';

class ColorVisionBloc extends Bloc<ColorVisionEvent, ColorVisionState> {
  final ColorVisionRepository _colorVisionRepository;

  ColorVisionBloc(this._colorVisionRepository) : super(ColorVisionInitial()) {
    on<OnStartColorVisionTest>(onStartColorVisionTest);
    on<OnInitShuffleColorVisionTest>(_onInitShuffleColorVisionTest);
    on<OnGetSpeechToText>(_onGetSpeechToText);
    on<OnGetResultTest>(_onGetResultTest);
  }

  void _onGetSpeechToText(
      OnGetSpeechToText event, Emitter<ColorVisionState> emit) {
    final state = this.state;

    if (state is ColorVisionStart) {
      final currentIndex = state.currentIndex;
      final colorDataModels = state.colorDataModels;

      colorDataModels[currentIndex] = ColorDataModel(
          colorName: colorDataModels[currentIndex].colorName,
          colorCode: colorDataModels[currentIndex].colorCode,
          family: colorDataModels[currentIndex].family,
          isCorrect: colorDataModels[currentIndex].colorName ==
              event.words.toLowerCase());

      final isDone = currentIndex + 1 == 21;

      emit(
        state.copyWith(
          colorDataModels: colorDataModels,
          currentIndex: isDone ? currentIndex : currentIndex + 1,
          isDoneExam: isDone,
        ),
      );
    }
  }

  void onStartColorVisionTest(
      OnStartColorVisionTest event, Emitter<ColorVisionState> emit) {
    final state = this.state;

    if (state is ColorVisionStart) {
      emit(
        state.copyWith(isStartExam: true),
      );
    }
  }

  void _onInitShuffleColorVisionTest(OnInitShuffleColorVisionTest event,
      Emitter<ColorVisionState> emit) async {
    emit(ColorVisitionLoading());

    try {
      final colorModels = await _colorVisionRepository.shuffleColorTest();
      emit(ColorVisionStart(colorDataModels: colorModels));
    } catch (e) {
      emit(ColorVisitionError());
    }
  }

  void _onGetResultTest(OnGetResultTest event, Emitter<ColorVisionState> emit) {
    final state = this.state;

    if (state is ColorVisionStart) {
      emit(
        ColorVisionResult(
          getResultsColorTest(state.colorDataModels),
        ),
      );
    }
  }

  List<ColorResultModel> getResultsColorTest(List<ColorDataModel> data) {
    data.sort((a, b) => a.colorName.compareTo(b.colorName));
    final List<ColorResultModel> colorResults = [
      ColorResultModel.iniColor('blue'),
      ColorResultModel.iniColor('green'),
      ColorResultModel.iniColor('indigo'),
      ColorResultModel.iniColor('orange'),
      ColorResultModel.iniColor('red'),
      ColorResultModel.iniColor('violet'),
      ColorResultModel.iniColor('yellow'),
    ];

    for (var i = 0; i < data.length; i++) {
      final element = data[i];

      switch (element.colorName) {
        case 'blue':
          colorResults[0] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[0]);

          break;
        case 'green':
          colorResults[1] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[1]);

          break;
        case 'indigo':
          colorResults[2] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[2]);
          break;
        case 'orange':
          colorResults[3] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[3]);
          break;
        case 'red':
          colorResults[4] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[4]);
          break;
        case 'violet':
          colorResults[5] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[5]);
          break;

        default:
          colorResults[6] = calculateResult(
              colorDataModel: element, colorResultModel: colorResults[6]);
      }
    }

    return colorResults;
  }

  double getPercentage(double currentPercent) {
    if (currentPercent == 0) {
      return 1 / 3 * 100;
    }
    final num = ((currentPercent / 100) * 3).round();
    return (num + 1) / 3 * 100;
  }

  ColorResultModel calculateResult({
    required ColorResultModel colorResultModel,
    required ColorDataModel colorDataModel,
  }) {
    if (colorDataModel.isCorrect) {
      final percentage = getPercentage(colorResultModel.percentage);
      return colorResultModel.copyWith(
        percentage: percentage,
        isDifficulty: percentage < 100,
        colorCode: colorDataModel.colorCode,
        colorName: colorDataModel.colorName,
      );
    }
    return colorResultModel;
  }
}
