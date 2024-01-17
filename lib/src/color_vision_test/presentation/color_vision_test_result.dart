import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/core/common_widget/common_widget.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/color_vision_test/data/models/color_result_model.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/bloc/color_vision_bloc.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/result/color_results_card.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/widgets/result/conclusion_results.dart';

class ColorVisionTestResult extends StatefulWidget {
  static const String routeName = '/color-vision-test-result';

  const ColorVisionTestResult({super.key});

  @override
  State<ColorVisionTestResult> createState() => _ColorVisionTestResultState();
}

class _ColorVisionTestResultState extends State<ColorVisionTestResult> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          title: 'Color Vision Test',
          showBackBtn: true,
        ),
        body: BlocBuilder<ColorVisionBloc, ColorVisionState>(
          builder: (context, state) {
            if (state is ColorVisionResult) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      const Text(
                        'Color Accuracy',
                        style: TextStyle(
                          color: ColorName.placeHolder,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        color: ColorName.placeHolder,
                      ),
                      const Gap(10),
                      ColorResultsCard(
                        colorResultModel: state.colorResultModel,
                      ),
                      const Gap(10),
                      const Divider(
                        color: ColorName.placeHolder,
                      ),
                      ConclusionResults(
                        colorResultModel:
                            getIsDifficulty(state.colorResultModel),
                      ),
                      const Gap(10),
                      CustomBtn(
                        label: 'Finish',
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  List<ColorResultModel> getIsDifficulty(List<ColorResultModel> data) {
    return data.where((e) => e.isDifficulty).toList();
  }
}
