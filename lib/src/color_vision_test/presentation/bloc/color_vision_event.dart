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
  const OnGetSpeechToText(this.words);

  @override
  List<Object> get props => [
        words,
      ];
}

class OnGetResultTest extends ColorVisionEvent {}
