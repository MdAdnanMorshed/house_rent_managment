import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/models/flat_floor_model.dart';
import 'package:house_management/app/models/flat_no_model.dart';
import 'package:house_management/app/models/flat_size_model.dart';
import 'package:house_management/app/routes/app_pages.dart';

import '../../../global_widgets/header_withbg_color_widget.dart';
import '../../../models/paly_role_model.dart';
import '../controllers/create_flat_controller.dart';

class CreateFlatView extends GetView<CreateFlatController> {
  const CreateFlatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
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
          body: Stack(
            children: [
              const HeaderWithBgColorWidget(),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 30,
                  left: 10,
                  right: 10,
                ),
                child: _buildBody(context),
              )
            ],
          )),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<CreateFlatController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 120,
                  ),
                  // _getDataPlayRole(_),
                  AppSpace.spaceH12,
                  _selectFlatRoomDropDown(context, _),


                  AppSpace.spaceH14,
                  _selectFlatNoDropDown(context, _),

                  AppSpace.spaceH14,

                  _selectFlatSizDropDown(context, _),
                  AppSpace.spaceH16,

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
                  AppSpace.spaceH20,
                  _createFlatBTN(context, _)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// done
  _selectFlatNoDropDown(BuildContext context, CreateFlatController _) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Flat_No').snapshots(),
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
              child: Text("Flat No Found Data !"),
            ),
          );
        }
        if (snapshot.hasData) {
          List<FlatNoModel> flatNoModel = [];

          for (var doc in snapshot.data!.docs) {
            flatNoModel
                .add(FlatNoModel.fromJson(doc.data() as Map<String, dynamic>));
          }
          controller.flatNo(flatNoModel);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (_.flatNoList.isEmpty) {
                return const Text('Data Fetch ...');
              } else {
                return Row(
                  children: [
                    Container(
                      height: 50,
                      width: Get.width * .8-5,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.grey.withOpacity(0.2), 10),
                      padding: const EdgeInsets.only(right: 10, left: 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          value: _.dropdownFlatNoValue.value,
                          items:
                              _.flatNoList.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.flatNo,
                              child: Text(
                                value.flatNo.toString(),
                                style: AppTextStyle.labelSmall,
                              ),
                              onTap: () {
                                _.flatNoID.value = value.flatNoId.toString();
                                _.flatNoValue.value = value.flatNo.toString();
                              },
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print('CreateFlatView._selectFlatNoDropDown $newValue');
                            _.dropdownFlatNoValue.value = newValue.toString();
                          },
                        ),
                      ),
                    ),
                    AppSpace.spaceW6,
                    InkWell(
                      onTap:(){
                        print('CreateFlatView._selectFlatNoDropDown');
                        Get.toNamed(Routes.ADMIN_FALT_NO);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: Helpers.customCircularDecoretion(
                            context, AppColors.primaryColor, 10),
                        child: Text(
                          ' + '.tr,
                          style: AppTextStyle.button,
                        ),
                      ),
                    )
                  ],
                );
              }
            }),
          );
        }
        return const SizedBox();
      }),
    );
  }

  ///done
  _selectFlatRoomDropDown(BuildContext context, CreateFlatController _) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Flat_Floor').snapshots(),
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
              child: Text("Flat No Found Data !"),
            ),
          );
        }
        if (snapshot.hasData) {
          List<FlatFloorModel> flatFloorModel = [];

          for (var doc in snapshot.data!.docs) {
            flatFloorModel.add(
                FlatFloorModel.fromJson(doc.data() as Map<String, dynamic>));
          }
          controller.flatFloor(flatFloorModel);

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (_.flatFloorList.isEmpty) {
                return const Text('Data Fetch ...');
              } else {
                return Row(
                  children: [
                    Container(
                      height: 50,
                      width: Get.width * .8-5,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.grey.withOpacity(0.2), 10),
                      padding: const EdgeInsets.only(right: 10, left: 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          value: _.dropdownFlatFloorValue.value,
                          items: _.flatFloorList
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.flatFloor,
                              child: Text(
                                value.flatFloor.toString(),
                                style: AppTextStyle.labelSmall,
                              ),
                              onTap: () {
                                _.flatFloorID.value = value.flatFloorId.toString();
                                _.flatFloorValue.value = value.flatFloor.toString();
                              },
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print(
                                'CreateFlatView._selectFlatRoomDropDown $newValue');
                            _.dropdownFlatFloorValue.value = newValue.toString();
                          },
                        ),
                      ),
                    ),
                    AppSpace.spaceW6,
                    InkWell(
                      onTap:(){
                        print('CreateFlatView._selectFlatRoomDropDown');
                        Get.toNamed(Routes.ADMIN_FLAT_FLOOR);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: Helpers.customCircularDecoretion(
                            context, AppColors.primaryColor, 10),
                        child: Text(
                          ' + '.tr,
                          style: AppTextStyle.button,
                        ),
                      ),
                    )
                  ],
                );
              }
            }),
          );
        }
        return const SizedBox();
      }),
    );
  }

  /// done
  _selectFlatSizDropDown(BuildContext context, CreateFlatController _) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Flat_Size').snapshots(),
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
              child: Text("Flat No Found Data !"),
            ),
          );
        }
        if (snapshot.hasData) {
          List<FlatSizeModel> flatSize = [];
          for (var doc in snapshot.data!.docs) {
            flatSize.add(
                FlatSizeModel.fromJson(doc.data() as Map<String, dynamic>));
          }
          controller.flatSize(flatSize);

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Obx(() {
              if (_.flatSizeList.isEmpty) {
                return const Text('Data Fetch ...');
              } else {
                return Row(
                  children: [
                    Container(
                      height: 50,
                      width: Get.width * .8-5,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.grey.withOpacity(0.2), 10),
                      padding: const EdgeInsets.only(right: 10, left: 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          value: _.dropdownFlatSizeValue.value,
                          items:
                              _.flatSizeList.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.flatSize,
                              child: Text(
                                value.flatSize.toString(),
                                style: AppTextStyle.labelSmall,
                              ),
                              onTap: () {
                                _.flatSizeID.value = value.flatSizeId.toString();
                                _.flatSizeValue.value = value.flatSize.toString();
                              },
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print(
                                'CreateFlatView._selectFlatSizDropDown $newValue');
                            _.dropdownFlatSizeValue.value = newValue.toString();
                          },
                        ),
                      ),
                    ),
                    AppSpace.spaceW6,
                    InkWell(
                      onTap:(){
                        print('CreateFlatView._selectFlatSizDropDown');
                        Get.toNamed(Routes.ADMIN_FLAT_SIZE);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: Helpers.customCircularDecoretion(
                            context, AppColors.primaryColor, 10),
                        child: Text(
                          ' + '.tr,
                          style: AppTextStyle.button,
                        ),
                      ),
                    )
                  ],
                );
              }
            }),
          );
        }
        return const SizedBox();
      }),
    );
  }

  _createFlatBTN(BuildContext context, CreateFlatController _) {
    return InkWell(
      onTap: () {
        String floor = _.flatFloorController.text;
        String flatAmount = _.flatAmountController.text;
        String serviceBill = _.flatServiceController.text;
        String waterBill = _.flatWaterBillController.text;
        String gasBill = _.flatGasBillController.text;

        String flatNo = _.dropdownFlatNoValue.value;
        String flatSize = _.dropdownFlatSizeValue.value;
        String flatFloor = _.dropdownFlatFloorValue.value;

        Map<String, dynamic> createFlatMApBody = {
          'flatNo': flatNo,
          'flatFloor': floor,
          'FlatAmount': flatAmount,
          'flatFloor': flatFloor,
          'flatServiceBill': serviceBill,
          'flatWaterBill': waterBill,
          'flatGasBill': gasBill,
          'flatSize': flatSize,
        };
        print('CreateFlatView._buildBody $createFlatMApBody');

        controller.createFlat();
      },
      child: Container(
        height: 50,
        width: Get.width - 30,
        alignment: Alignment.center,
        decoration: Helpers.customCircularDecoretion(
            context, AppColors.primaryColor, 10),
        child: Text(
          'Create Flat '.tr,
          style: AppTextStyle.button,
        ),
      ),
    );
  }
}
