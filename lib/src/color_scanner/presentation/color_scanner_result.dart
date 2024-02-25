import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:seeing_beyond/core/common_widget/custom_appbar.dart';
import 'package:seeing_beyond/gen/colors.gen.dart';
import 'package:seeing_beyond/src/color_scanner/data/data_sources/color_scanner_repository_impl.dart';

import 'package:seeing_beyond/src/color_scanner/presentation/bloc/color_scanner_bloc.dart';
import 'package:seeing_beyond/src/color_scanner/presentation/widgets/color_result_body.dart';

class ColorScannerResultArgs {
  final ImageProvider imageProvider;
  final bool isScanner;

  const ColorScannerResultArgs({
    required this.imageProvider,
    this.isScanner = false,
  });
}

class ColorScannerResult extends StatefulWidget {
  static const String routeName = '/color-scanner-result';
  final ColorScannerResultArgs args;

  const ColorScannerResult({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<ColorScannerResult> createState() => _ColorScannerResultState();
}

class _ColorScannerResultState extends State<ColorScannerResult> {
  PaletteGenerator? paletteGenerator;
  late ColorScannerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ColorScannerBloc(ColorScannerRepositoryImpl());

    _updatePaletteGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(OnLoadingColorScanner()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'Color Scanner'),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorName.border,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image(
                    image: widget.args.imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
                const Gap(
                  30,
                ),
                const ColorResultBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initBlocs() {
    if (paletteGenerator != null) {
      bloc.add(
        OnGetScanResult(
          color: paletteGenerator!.dominantColor!.color,
          isScanner: widget.args.isScanner,
        ),
      );
      return;
    }

    bloc.add(OnColorErrorEvent());
  }

  Future<void> _updatePaletteGenerator() async {
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image(image: widget.args.imageProvider, fit: BoxFit.contain).image,
      maximumColorCount: 2,
    );
    setState(() {});
    initBlocs();
  }
}
