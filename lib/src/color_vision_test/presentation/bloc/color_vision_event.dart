part of 'color_vision_bloc.dart';

abstract class ColorVisionEvent extends Equatable {
  const ColorVisionEvent();

  @override
  List<Object> get props => [];
}

class OnStartColorVisionTest extends ColorVisionEvent {}

class OnInitShuffleColorVisionTest extends ColorVisionEvent {}

class OnGetSpeechToText extends ColorVisionEvent {
  final String words;
  final bool isOverrideWrongAnswer;

  const OnGetSpeechToText({
    required this.words,
    required this.isOverrideWrongAnswer,
  });

  @override
  List<Object> get props => [words, isOverrideWrongAnswer];
}

class OnGetResultTest extends ColorVisionEvent {}
