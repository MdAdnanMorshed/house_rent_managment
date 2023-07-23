import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/create_flat_model.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final count = 0.obs;
  int selectedIndex = 0;
  final _flats = <CreateFlatModel>[].obs;
  List<CreateFlatModel> get flatList => _flats;
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

  void updateState() => update();
/*  List flatList = [
    {'flatNo': 'A1','flatFloor': '1th', 'color': const Color(0xff3A98B9), "bill": "৳ 12000","flatStatus": "Active"},
    {'flatNo': 'A2','flatFloor': '2th', 'color': const Color(0xffBFACE2), "bill": "৳ 12000","flatStatus": "UnActive"},
    {'flatNo': 'B1','flatFloor': '3th', 'color': const Color(0xff0E8388), "bill": "৳ 12000","flatStatus": "pending"},
    {'flatNo': 'B2','flatFloor': '4th', 'color': const Color(0xff655DBB), "bill": "৳ 12000","flatStatus": "Processing"},
    {'flatNo': 'C1','flatFloor': '5th', 'color': const Color(0xff3A98B9), "bill": "৳ 12500","flatStatus": "Active"},
    {'flatNo': 'C2','flatFloor': '6th', 'color': const Color(0xffBFACE2), "bill": "৳ 13000","flatStatus": "Active"},
    {'flatNo': 'D1','flatFloor': '7th', 'color': const Color(0xff0E8388), "bill": "৳ 15000","flatStatus": "Active"},
    {'flatNo': 'D2','flatFloor': '8th', 'color': const Color(0xff3A98B9), "bill": "৳ 12000","flatStatus": "Active"},
    {'flatNo': 'E1','flatFloor': '9th', 'color': const Color(0xff655DBB), "bill": "৳ 12000","flatStatus": "Active"},
    {'flatNo': 'E2','flatFloor': '10th', 'color': const Color(0xffBFACE2),"bill": "৳ 12000","flatStatus": "Active"},
  ];*/

  List flatSummery = [
    {'summeryKey': 'Total Rent', 'summeryValue': '৳ 2,50,000'},
    {'summeryKey': 'Total Earn', 'summeryValue': '৳ 2,00,000'},
    {'summeryKey': 'Total Due', 'summeryValue': '৳ 49,000'},
    {'summeryKey': 'Total Expense', 'summeryValue': '৳ 10000'},
    {'summeryKey': 'Total Assign Flat', 'summeryValue': '1'},
  ];


  getFlat(List<CreateFlatModel> data) {
    _flats.value = data;
  }
}
