import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../models/paly_role_model.dart';

class AdminPlayRoleController extends GetxController {
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

  createPlayRole() async {
    final  db = FirebaseFirestore.instance;
    if (playRoleController.text == '') {
      print('AdminPlayRoleController.createPlayRole Empty Data');
    } else {
      print('Play Role : ${playRoleController.text}');
      final docRef = db.collection('Play_Role').doc();
      PlayRoleModel playRole = PlayRoleModel(
          playRoleId: docRef.id,
          playRole: playRoleController.text.toString(),
          playRoleStatus: false);
      await docRef.set(playRole.toJson()).then(

          (value) {

            playRoleController.clear();
            log("Play Role  has successfully!");
          },
          onError: (e) => log("Error booking appointment: $e"));


    }
  }

  getPlayRole() async {
    final  db = FirebaseFirestore.instance;

      return  db.collection('Play_Role').snapshots;



  }

}
