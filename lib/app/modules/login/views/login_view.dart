import 'dart:convert';

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

import '../../../global_widgets/bottom_withbg_color_widget.dart';
import '../../../global_widgets/header_withbg_color_widget.dart';
import '../../../models/paly_role_model.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
    return GetBuilder<LoginController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png',width: 200,height: 200,),
                 // _getDataPlayRole(),

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
                      if(_.dropdownValue=='Admin'){
                        Get.toNamed(Routes.ADMIN_DASHBOARD);
                      }else{
                        Get.toNamed(Routes.HOME);
                      }

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

  _getDataPlayRole() {
    return Container(
        height: 300.0,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: StreamBuilder(
          stream:
          FirebaseFirestore.instance.collection('Play_Role').snapshots(),
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
                final data =
                PlayRoleModel.fromJson(doc.data() as Map<String, dynamic>);
                playRole.add(data);
              }

              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child:
                  _selectRoleType1(context,playRole));
            }

            return const SizedBox();
          }),
        ));
  }

  _selectRoleType1(BuildContext context, List<PlayRoleModel> data) {
    print('LoginView._selectRoleType1 ${data.length}');
    print('LoginView._selectRoleType1 ${data.length}');
    String dropdownValue ='rent';
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value:dropdownValue,
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
          items:data.map<DropdownMenuItem<String>>(( e) {return DropdownMenuItem(child: Text('rent'));}).toList(),

      /*    <String>['Select', 'rent','Rent Owner','Rent'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyle.labelSmall,
              ),
            );
          }).toList(),*/
          onChanged: (String? newValue) {
            dropdownValue = newValue!;

          },
        ),
      ),
    );
  }

  _selectRoleType(BuildContext context, LoginController _) {
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
          items:
          <String>['Select', 'Admin','Rent Owner','Rent']
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

  Future<void> playRoleDropdown(List<PlayRoleModel> data) async {
    var currencyDropdownItem = <DropdownMenuItem>[];
    currencyDropdownItem = [];
    currencyDropdownItem.add(
      DropdownMenuItem(
        value: '0',
        child: Text(
          "Select Currency",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Get.textTheme.bodyText1,
        ),
      ),
    );
    for (var item in data) {
      currencyDropdownItem.add(DropdownMenuItem(
        value: item.playRole,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.playRoleStatus.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.bodyText1,
          ),
        ),
      ));
    }
  }
}
