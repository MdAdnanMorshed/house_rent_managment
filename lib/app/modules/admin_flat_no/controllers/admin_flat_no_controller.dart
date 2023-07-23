import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/flat_no_model.dart';

import '../../../models/paly_role_model.dart';

class AdminFlatNoController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  var flatNoController = TextEditingController();

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

  createFlatNo() async {
    final  db = FirebaseFirestore.instance;
    if (flatNoController.text == '') {
      print('AdminFlatNoController.createFlatNo Empty');
    } else {
      print('Play Role : ${flatNoController.text}');
      final docRef = db.collection('Flat_No').doc();
      FlatNoModel flatNoModel = FlatNoModel(
          flatNoId: docRef.id,
          flatNo: flatNoController.text.toString(),
          flatNoStatus: false);
      await docRef.set(flatNoModel.toJson()).then(

          (value) {

            flatNoController.clear();
            log("Flat No  has successfully!");
          },
          onError: (e) => log("Error flat no : $e"));


    }
  }

  getPlayRole() async {
    final  db = FirebaseFirestore.instance;

      return  db.collection('Flat_No').snapshots;



  }

}
