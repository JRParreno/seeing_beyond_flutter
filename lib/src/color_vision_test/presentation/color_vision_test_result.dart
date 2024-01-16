import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/src/color_vision_test/presentation/bloc/color_vision_bloc.dart';

class ColorVisionTestResult extends StatefulWidget {
  static const String routeName = '/color-vision-test-result';

  const ColorVisionTestResult({super.key});

  @override
  State<ColorVisionTestResult> createState() => _ColorVisionTestResultState();
}

class _ColorVisionTestResultState extends State<ColorVisionTestResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'Color Results'),
      body: BlocBuilder<ColorVisionBloc, ColorVisionState>(
        builder: (context, state) {
          if (state is ColorVisionResult) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: state.colorResultModel.length,
                itemBuilder: (context, index) {
                  final item = state.colorResultModel[index];

                  return Column(
                    children: [
                      Text('${item.colorName} ${item.percentage}%'),
                    ],
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
