import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/paly_role_model.dart';
import '../../../models/user_account_model.dart';

class AdminRegistrationController extends GetxController {

  var mailOrPhoneController = TextEditingController();
  var passwordController = TextEditingController();

  final dropdownValue = 'Admin'.obs;
  final playRoleID = ''.obs;
  final playRoleName = ''.obs;
  var loginRole = <DropdownMenuItem>[].obs;
  final _playRoles = <PlayRoleModel>[].obs;



  List<PlayRoleModel> get playRoleList => _playRoles;
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


  role(List<PlayRoleModel> data) {
    _playRoles.value = data;
  }

  createUserAccount() async {
    final db = FirebaseFirestore.instance;
    if (playRoleID.value == '') {
      Get.snackbar('Alert', 'Please Select your Role ');
    } else {
      if (mailOrPhoneController.text == '' && passwordController.text == '') {
        print('AdminPlayRoleController.createPlayRole Empty Data');
      } else {
        final docRef = db.collection('Users').doc();
        UserAccountModel userAccountModel = UserAccountModel(
            userID: docRef.id,
            playRoleId: playRoleID.value,
            playRoleName: playRoleName.value,
            userMail: mailOrPhoneController.text,
            userPassword: passwordController.text);
        await docRef.set(userAccountModel.toJson()).then((value) {
          mailOrPhoneController.clear();
          passwordController.clear();
          log("Play Role  has successfully!");
        }, onError: (e) => log("Error booking appointment: $e"));
      }
    }
  }
}
