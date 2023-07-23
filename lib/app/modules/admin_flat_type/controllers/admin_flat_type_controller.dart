import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/flat_no_model.dart';
import 'package:house_management/app/models/flat_type_model.dart';

import '../../../models/paly_role_model.dart';

class AdminFlatTypeController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  var flatTypeController = TextEditingController();

  List<PlayRoleModel> playRole = [];
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

  createFlatType() async {
    final db = FirebaseFirestore.instance;
    if (flatTypeController.text == '') {
      print('AdminFlatNoController.createFlatNo Empty');
    } else {
      print('Play Role : ${flatTypeController.text}');
      final docRef = db.collection('Flat_Type').doc();
      FlatTypeModel flatTypeModel = FlatTypeModel(
          flatTypeId: docRef.id,
          flatType: flatTypeController.text.toString(),
          flatTypeStatus: false);
      await docRef.set(flatTypeModel.toJson()).then((value) {
        flatTypeController.clear();
        log("Flat Type  has successfully!");
      }, onError: (e) => log("Error flat type : $e"));
    }
  }
}
