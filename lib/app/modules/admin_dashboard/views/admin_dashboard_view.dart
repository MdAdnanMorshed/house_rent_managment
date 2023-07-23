import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/routes/app_pages.dart';

import '../../../global_widgets/bottom_withbg_color_widget.dart';
import '../../../global_widgets/header_withbg_color_widget.dart';
import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body:
        _buildBody(context)

      ),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<AdminDashboardController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Admin Panel'),
                        AppSpace.spaceH8,
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_PLAY_ROLE);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Play Role '.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                        AppSpace.spaceH8,
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_REGISTRATION);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Registration'.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                        AppSpace.spaceH8,
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_FLAT_FLOOR);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Flat Floor'.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                        AppSpace.spaceH8,
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_FALT_NO);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Flat No'.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                        AppSpace.spaceH8,
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_FLAT_SIZE);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Flat Size'.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                        AppSpace.spaceH8,

                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADMIN_FALT_TYPE);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Flat Type'.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                        AppSpace.spaceH8,


                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Logout'.tr,
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                 AppSpace.spaceW10,
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment:  Alignment.center,
                       color: Colors.blueGrey.shade300,
                      child: Text('View '), height: 400,width: 200, ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
