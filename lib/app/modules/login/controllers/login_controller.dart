import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/paly_role_model.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final dropdownValue = 'Admin'.obs;
  final playRoleID = ''.obs;
  var loginRole = <DropdownMenuItem>[].obs;
  final _playRoles = <PlayRoleModel>[].obs;

  var mailOrPhoneController= TextEditingController();
  var passwordController= TextEditingController();

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

  void increment() => count.value++;


  role(List<PlayRoleModel> data){
     _playRoles.value=data;
  }



}
