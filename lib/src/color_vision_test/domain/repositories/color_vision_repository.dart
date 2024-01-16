import 'package:seeing_beyond/core/test_data/model/color_data_model.dart';
import 'package:seeing_beyond/src/color_vision_test/data/models/color_result_model.dart';

abstract class ColorVisionRepository {
  Future<List<ColorDataModel>> shuffleColorTest();
  List<ColorResultModel> getResultColorVistionTest(
      List<ColorDataModel> colorDataModels);
}
