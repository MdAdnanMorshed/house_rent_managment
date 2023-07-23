import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/flat_floor_model.dart';

import '../../../models/paly_role_model.dart';

class AdminFlatFloorController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  var flatFloorController = TextEditingController();

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

  createFlatFloor() async {
    final  db = FirebaseFirestore.instance;
    if (flatFloorController.text == '') {
      print('AdminFlatFloorController.createFlatFloor Empty');
    } else {
      print('Play Role : ${flatFloorController.text}');
      final docRef = db.collection('Flat_Floor').doc();
      FlatFloorModel flatFloorModel = FlatFloorModel(
          flatFloorId: docRef.id,
          flatFloor: flatFloorController.text.toString(),
          flatFloorStatus: false);
      await docRef.set(flatFloorModel.toJson()).then(

          (value) {

            flatFloorController.clear();

        log("Flat Floor  has successfully!");
          },
          onError: (e) => log("Error flat floor appointment: $e"));


    }
  }

  getPlayRole() async {
    final  db = FirebaseFirestore.instance;

      return  db.collection('Flat_Floor').snapshots;



  }

}
