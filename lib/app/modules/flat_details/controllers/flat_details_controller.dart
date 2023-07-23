import 'package:get/get.dart';

import '../../../models/create_flat_model.dart';

class FlatDetailsController extends GetxController {
  //TODO: Implement FlatDetailsController

  final count = 0.obs;

  var flatInfo;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  List propertyTypeList = [
    "Flat",
    "House/Villa",
    "Office Space",
    "Shop/Showroom",
    "Other-Commercial",
  ];
    List bedroomsList = [
    "1 BR",
    "2 BR",
    "3 BR",
    "4 BR",
    "5 BR",
    "6 BR",
  ];
}
