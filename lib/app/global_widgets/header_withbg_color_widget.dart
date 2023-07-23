import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/values/app_colors.dart';

class HeaderWithBgColorWidget extends StatelessWidget {
  const HeaderWithBgColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.15,
      padding:  EdgeInsets.symmetric(
          horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(26),
              bottomRight: Radius.circular(26))),
    );
  }
}