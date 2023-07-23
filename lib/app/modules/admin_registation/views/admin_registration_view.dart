import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/routes/app_pages.dart';

import '../../../models/paly_role_model.dart';
import '../controllers/admin_registration_controller.dart';



class AdminRegistrationView extends GetView<AdminRegistrationController> {
  const AdminRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Scaffold(backgroundColor: AppColors.white, body: _buildBody(context)),
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
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                  _getDataPlayRole(_),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: controller.mailOrPhoneController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "EnterEmail".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: controller.passwordController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "EnterPassword".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH26,
                  InkWell(
                    onTap: () {
                      Map<String, dynamic> loginData = {
                        'playRoleId': controller.playRoleID.value,
                        'emailOrPhone': controller.mailOrPhoneController.text,
                        'password': controller.passwordController.text,
                      };

                      print('LoginView._buildBody $loginData');
                      controller.createUserAccount();

                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.primaryColor, 10),
                      child: Text(
                        'Register '.tr,
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

  _getDataPlayRole(AdminRegistrationController controller) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Play_Role').snapshots(),
      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == null) {
          return const SizedBox();
        }
        if (snapshot.data!.docs.isEmpty) {
          return const SizedBox(
            child: Center(
              child: Text("Not Found Data !"),
            ),
          );
        }
        if (snapshot.hasData) {
          List<PlayRoleModel> playRole = [];

          for (var doc in snapshot.data!.docs) {
            playRole.add(
                PlayRoleModel.fromJson(doc.data() as Map<String, dynamic>));
          }
          controller.role(playRole);

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (controller.playRoleList.isEmpty) {
                return const Text('Data Fetch ...');
              } else {
                return Container(
                  width: Get.width - 20,
                  decoration: Helpers.customCircularDecoretion(
                      context, AppColors.grey.withOpacity(0.2), 10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      value: controller.dropdownValue.value,
                      items: controller.playRoleList
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.playRole,
                          child: Text(
                            value.playRole.toString(),
                            style: AppTextStyle.labelSmall,
                          ),
                          onTap: () {
                            controller.playRoleID.value = value.playRoleId.toString();
                            controller.playRoleName.value = value.playRole.toString();
                          },
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        print('LoginView._getDataPlayRole $newValue');
                        controller.dropdownValue.value = newValue.toString();
                      },
                    ),
                  ),
                );
              }
            }),
          );
        }
        return const SizedBox();
      }),
    );
  }
}

