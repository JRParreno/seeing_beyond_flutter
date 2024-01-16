part of 'color_vision_bloc.dart';

abstract class ColorVisionState extends Equatable {
  const ColorVisionState();

  @override
  List<Object> get props => [];
}

class ColorVisionInitial extends ColorVisionState {}

class ColorVisitionError extends ColorVisionState {}

class ColorVisitionLoading extends ColorVisionState {}

class ColorVisionStart extends ColorVisionState {
  final List<ColorDataModel> colorDataModels;
  final bool isDoneExam;
  final bool isStartExam;
  final int currentIndex;

  const ColorVisionStart({
    required this.colorDataModels,
    this.isDoneExam = false,
    this.isStartExam = false,
    this.currentIndex = 0,
  });

  @override
  List<Object> get props => [
        colorDataModels,
        isDoneExam,
        isStartExam,
        currentIndex,
      ];

  ColorVisionStart copyWith({
    List<ColorDataModel>? colorDataModels,
    bool? isDoneExam,
    bool? isStartExam,
    int? currentIndex,
  }) {
    return ColorVisionStart(
      colorDataModels: colorDataModels ?? this.colorDataModels,
      isDoneExam: isDoneExam ?? this.isDoneExam,
      isStartExam: isStartExam ?? this.isStartExam,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class ColorVisionResult extends ColorVisionState {
  final List<ColorResultModel> colorResultModel;

  const ColorVisionResult(this.colorResultModel);

  @override
  List<Object> get props => [
        colorResultModel,
      ];
}
