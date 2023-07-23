
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/models/flat_no_model.dart';
import 'package:house_management/app/models/paly_role_model.dart';
import '../controllers/admin_flat_no_controller.dart';

class AdminFlatNoView extends GetView<AdminFlatNoController> {
  const AdminFlatNoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Scaffold(backgroundColor: AppColors.white, body: _buildBody(context)),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<AdminFlatNoController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Flat No'),
                  AppSpace.spaceH20,
                  _getDataFlatNo(),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.flatNoController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Flat No".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH26,
                  InkWell(
                    onTap: () {
                      ///BD CODE Firebase
                      _.createFlatNo();
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.primaryColor, 10),
                      child: Text(
                        'Create Flat No'.tr,
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

  _getDataFlatNo() {
    return Container(
        height: 300.0,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('Flat_No').snapshots(),
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
              List<FlatNoModel> playRole = [];

              for (var doc in snapshot.data!.docs) {
                final data =
                FlatNoModel.fromJson(doc.data() as Map<String, dynamic>);
                playRole.add(data);
              }

              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: _getData(playRole));
            }

            return const SizedBox();
          }),
        ));
  }

  Widget _getData(List<FlatNoModel> listOfData) {
    List<DataRow> rows = [];

    int index = 0;
    for (var data in listOfData) {
      index++;
      rows.add(DataRow(cells: [
        DataCell(
          Text(index.toString()),
        ),
        DataCell(
          Text(data.flatNo.toString()),
        ),
        DataCell(
          Text("${data.flatNoStatus.toString()}"),
        ),
        DataCell(Row(
          children: [
            InkWell(
                onTap: () {
                  print('AdminPlayRoleView._getData01 Index $index');
                  print('data : ${jsonEncode(data)}');
                  FirebaseFirestore.instance
                      .collection('Flat_No')
                      .doc(data.flatNoId)
                      .delete()
                      .then((value) {
                    Get.snackbar('Alert', 'Delete has successfully!');
                  });
                },
                child: Icon(
                  Icons.delete_forever,
                  color: AppColors.red,
                )),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                print('AdminPlayRoleView._getData01 Index $index');
                print('data : ${jsonEncode(data)}');
                FirebaseFirestore.instance
                    .collection('Flat_No')
                    .doc(data.flatNoId)
                    .update(data.toJson())
                    .then((value) {
                  Get.snackbar('Alert', 'Update has successfully!');
                });
              },
              child: Icon(
                Icons.edit,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        )),
      ]));
    }

    return DataTable(
      dividerThickness: 2,
      dataRowHeight: 40,
      columnSpacing: 40,
      columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Flat No')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Active')),
      ],
      rows: rows,
    );
  }
}
