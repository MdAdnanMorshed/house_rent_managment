


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import '../../../models/rent_assign_model.dart';
import '../controllers/rent_assign_confirm_controller.dart';


class RentAssignConfirmView extends GetView<RentAssignConfirmController> {
  const RentAssignConfirmView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      Scaffold(backgroundColor: AppColors.white, body: _buildBody(context)),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<RentAssignConfirmController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Assign Confirm '),
                  AppSpace.spaceH20,
                  getAssignConfirm(),
                  AppSpace.spaceH14,

                ],
              ),
            ),
          ),
        );
      },
    );
  }

  getAssignConfirm() {
    return Container(
        height: 300.0,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: StreamBuilder(
          stream:
          FirebaseFirestore.instance.collection('Rent_Assign_Confirm').snapshots(),
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
              List<RentAssignModel> rentAssignConfirmInfo = [];

              for (var doc in snapshot.data!.docs) {
                final data =
                RentAssignModel.fromJson(doc.data() as Map<String, dynamic>);
                rentAssignConfirmInfo.add(data);
              }

              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: _getData(rentAssignConfirmInfo));
            }

            return const SizedBox();
          }),
        ));
  }

  Widget _getData(List<RentAssignModel> listOfData) {
    List<DataRow> rows = [];

    int index = 0;
    for (var data in listOfData) {
      index++;
      rows.add(DataRow(cells: [
        DataCell(
          Text(index.toString()),
        ),
        DataCell(
          Text(data.rentName.toString()),
        ),
        DataCell(
          Text('F1'),
        ),
        DataCell(
          Text(data.joiningDate.toString()),
        ),
        DataCell(
          Text(data.advanceAmount.toString()),
        ),
        DataCell(
          Text("${data.status.toString()}"),
        ),
        DataCell(Row(
          children: [
            InkWell(
                onTap: () {
                  print('AdminPlayRoleView._getData01 Index $index');
                //  print('data : ${jsonEncode(data)}');
                  FirebaseFirestore.instance.collection('Rent_Assign_Confirm')
                      .doc(data.rentAssignID)
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

            data.status!='Confirm'?
            InkWell(
              onTap: () {
                print('RentAssignConfirmView._getData ${data.toJson()}');



                controller.rentAssignFlatPaymentSummeryWithProfile(data);


              },
              child: Icon(
                Icons.adb_rounded,
                color: AppColors.primaryColor,
              ),
            ):Container(),
          ],
        )),
      ]));
    }

    return DataTable(
      dividerThickness: 1,
      dataRowHeight: 40,
      columnSpacing: 20,
      showBottomBorder: true,
      columns: [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Rent Name ')),
        DataColumn(label: Text('Assign Flat ')),
        DataColumn(label: Text('Joning Date')),
        DataColumn(label: Text('Advance Amount')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Active')),
      ],
      rows: rows,
    );
  }
}