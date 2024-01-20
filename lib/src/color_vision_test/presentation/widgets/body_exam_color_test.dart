import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/core/utils/hex_to_colors.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';

import 'package:seeing_beyond/src/color_vision_test/presentation/bloc/color_vision_bloc.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/start_body.dart';

class BodyExamColorTest extends StatelessWidget {
  const BodyExamColorTest({
    Key? key,
    required this.state,
  }) : super(key: key);

  final ColorVisionStart state;

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state.isStartExam) ...[
                    Text(
                      'IDENTIFY THE COLOR ${state.isStartExam ? state.currentIndex + 1 : ''}/21 ${state.colorDataModels[state.currentIndex].colorName}',
                      style: const TextStyle(
                        color: ColorName.placeHolder,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Identify the color',
                      style: themeContext.textTheme.titleLarge,
                    ),
                  ],
                  const Gap(10),
                  if (!state.isDoneExam) ...[
                    Expanded(
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: state.isStartExam
                              ? hexToColors(state
                                  .colorDataModels[state.currentIndex]
                                  .colorCode)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black54,
                            width: 5,
                          ),
                        ),
                        duration: const Duration(
                          seconds: 1,
                        ),
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (!state.isStartExam) ...[
            const Gap(10),
            StartBody(
              onStart: () {
                startColorTest(context);
              },
            ),
          ],
        ],
      ),
    );
  }

  void startColorTest(BuildContext context) {
    BlocProvider.of<ColorVisionBloc>(context).add(OnStartColorVisionTest());
  }
}
