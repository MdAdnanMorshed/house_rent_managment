import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/payment_sheet_model.dart';
import 'package:house_management/app/models/rent_assign_model.dart';
import 'package:house_management/app/models/rent_assign_profile.dart';

import '../../../models/paly_role_model.dart';
import '../../../routes/app_pages.dart';

class RentAssignConfirmController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  var playRoleController = TextEditingController();

  List<PlayRoleModel> playRole =[];
  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


  getPlayRole() async {
    final  db = FirebaseFirestore.instance;
      return  db.collection('Rent_Assign_Confirm').snapshots;

  }

  /// testing
  rentAssignFlatPaymentSummeryWithProfile(RentAssignModel rentAssignModel) async {
    final db = FirebaseFirestore.instance;
    final refKey = db.collection('Rent_Assign_payment_sheet');
    final refkeyAssign = db.collection('Rent_Assign_Confirm').doc();
    final refKeyProfile = db.collection('Rent_Assign_profile').doc();

    db.collection('Rent_Assign_Confirm').doc(rentAssignModel.rentAssignID).update({'status':'Confirm'});

    PaymentSheetModel data =PaymentSheetModel(
      id: rentAssignModel.createFlatID,
      months: 'may',
      amount: '0.0',
      advanceAmount: rentAssignModel.advanceAmount.toString(),
      status: 'Pending',
      date: '1/1/2023',
    );
    RentAssignProfileModel data1 =RentAssignProfileModel(
      id: refKeyProfile.id.toString(),
      flatAssignID: rentAssignModel.rentAssignID,
      flatId: rentAssignModel.createFlatID,
      rentName: rentAssignModel.rentName,
      password: rentAssignModel.rentDefaultPassword,
      phone: rentAssignModel.rentPhone
    );
    await refKey.doc(rentAssignModel.createFlatID). set(data.toJson());
    await refKeyProfile.set(data1.toJson());
    Get.toNamed(Routes.HOME);

  }

}

