import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/routes/app_pages.dart';

import '../../../global_widgets/header_withbg_color_widget.dart';
import '../controllers/create_flat_controller.dart';

class CreateFlatView extends GetView<CreateFlatController> {
  const CreateFlatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          elevation: 0.2,
          title: const Text(
            'Create Flat ',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          ),
        ),
        body: /*Stack(children: [




          Container(
                color: Colors.green,
                height: 500,width: 400,),

          Positioned(
            top: 50,
            left: 10,
            right: 10,
            bottom: 10,
            child:  Container(
            color: Colors.blue,
            height: 200,width: 500,),
          )


        ],)*/

        Stack(
          children: [
            const HeaderWithBgColorWidget(),

            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 30,
                left: 10,
                right: 10,
              ),
              child:_buildBody(context),
            )
          ],
        )
      ),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<CreateFlatController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(10),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/logo.png',width: 150,height: 120,),

                  AppSpace.spaceH12,
                  _selectFlatNoDropDown(context, _),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller:  _.flatFloorController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Flat Floor".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH14,

                  CustomTextField(
                    controller: _.flatAmountController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Flat Amount ".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  _selectFlatRoomDropDown(context, _),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.flatServiceController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Service Bill ".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,

                  CustomTextField(
                    controller: _.flatWaterBillController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Water Bill ".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.flatGasBillController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Ges Bill ".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  _selectFlatSizDropDown(context, _),
                  AppSpace.spaceH16,

                  InkWell(
                    onTap: () {

                      String floor=_.flatFloorController.text;
                      String flatAmount=_.flatAmountController.text;
                      String serviceBill=_.flatServiceController.text;
                      String waterBill=_.flatWaterBillController.text;
                      String gasBill=_.flatGasBillController.text;

                      String flatNo=_.dropdownFlatNoValue;
                      String flatSize=_.dropdownFlatSizeValue;
                      String flatRoom=_.dropdownFlatRoomValue;


                      Map<String,dynamic> createFlatMApBody={
                        'flatNo':flatNo,
                        'flatFloor':floor,
                        'FlatAmount':flatAmount,
                        'flatRoom':flatRoom,
                        'flatServiceBill':serviceBill,
                        'flatWaterBill':waterBill,
                        'flatGasBill':gasBill,
                        'flatSize':flatSize,
                      };
                      print('CreateFlatView._buildBody $createFlatMApBody');

                      Get.toNamed(Routes.HOME);
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.primaryColor, 10),
                      child: Text(
                        'Create Flat '.tr,
                        style: AppTextStyle.button,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _selectFlatNoDropDown(BuildContext context, CreateFlatController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownFlatNoValue,
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
          items: <String>['Select Flat No', 'A1','A2','A3','A4','A5','B1','B2','B3','B4','B5','C1','C2','C3','C4','C5','D1','D2','D3','D4','D5','E1','E2','E3','E4','E5','F1','F2','F3','F4','F5',]
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
            _.dropdownFlatNoValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

  _selectFlatRoomDropDown(BuildContext context, CreateFlatController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownFlatRoomValue,
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
          items: <String>['Select Flat Room', '1','2','3','4','5']
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
            _.dropdownFlatRoomValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

  _selectFlatSizDropDown(BuildContext context, CreateFlatController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownFlatSizeValue,
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
          items: <String>['Select Flat Size', '900 Sq.fit','900 Sq.fit','950 Sq.fit','1000 Sq.fit','1050 Sq.fit','1100 Sq.fit','1200 Sq.fit','1300 Sq.fit']
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
            _.dropdownFlatSizeValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

}


