import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/routes/app_pages.dart';

import '../controllers/admin_registration_controller.dart';

class AdminRegistrationView extends GetView<AdminRegistrationController> {
  const AdminRegistrationView({Key? key}) : super(key: key);
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
    return GetBuilder<AdminRegistrationController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png',width: 200,height: 200,),
                  _selectRoleType(context, _),
                  AppSpace.spaceH14,
                  CustomTextField(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "EnterEmail".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "EnterPassword".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH26,
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.primaryColor, 10),
                      child: Text(
                        'Login'.tr,
                        style: AppTextStyle.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _selectRoleType(BuildContext context, AdminRegistrationController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownValue,
          iconStyleData: const IconStyleData(
            iconSize: 22,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
          ),
          dropdownStyleData: DropdownStyleData(
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.white,
              ),
              elevation: 8,
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          items: <String>['Select', 'Admin','Rent Owner','Rent']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyle.labelSmall,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            _.dropdownValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

}
