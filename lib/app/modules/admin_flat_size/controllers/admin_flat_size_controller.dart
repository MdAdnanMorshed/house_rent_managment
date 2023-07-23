import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/flat_size_model.dart';

import '../../../models/paly_role_model.dart';

class AdminFlatSizeController extends GetxController {
  final count = 0.obs;
  String dropdownValue = 'Select';
  var flatSizeController = TextEditingController();

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

  createFlatSize() async {
    final  db = FirebaseFirestore.instance;
    if (flatSizeController.text == '') {
      print('AdminFlatSizeController.createFlatSize Empty' );
    } else {
      print('Play Role : ${flatSizeController.text}');
      final docRef = db.collection('Flat_Size').doc();
      FlatSizeModel flatSizeModel = FlatSizeModel(
          flatSizeId: docRef.id,
          flatSize: flatSizeController.text.toString(),
          flatSizeStatus: false);
      await docRef.set(flatSizeModel.toJson()).then(

          (value) {

            flatSizeController.clear();
            log("flat size  has successfully!");
          },
          onError: (e) => log("Error flat size: $e"));


    }
  }

  getFlatSize() async {
    final  db = FirebaseFirestore.instance;
      return  db.collection('Flat_Size').snapshots;

  }

}
