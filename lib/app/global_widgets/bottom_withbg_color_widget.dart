import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/values/app_colors.dart';

class BottomWithBgColorWidget extends StatelessWidget {
  const BottomWithBgColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.25,
      padding:  EdgeInsets.symmetric(
          horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(26))),
    );
  }
}