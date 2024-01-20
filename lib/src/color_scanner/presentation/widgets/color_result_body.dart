import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/bloc/color_scanner_bloc.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/widgets/color_scanner_results_card.dart';

class ColorResultBody extends StatelessWidget {
  const ColorResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: BlocBuilder<ColorScannerBloc, ColorScannerState>(
        builder: (context, state) {
          if (state is ColorScannerErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          if (state is ColorScannerLoaded) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  state.result.exactColor != null
                      ? 'Color: ${state.result.exactColor?.toUpperCase()}'
                      : 'TOP RESULT: ${state.result.nearColors[0].colorName.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorName.placeHolder,
                  ),
                ),
                const Gap(
                  30,
                ),
                ColorScannerResultsCard(
                  colorScanResultModel: state.result,
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
