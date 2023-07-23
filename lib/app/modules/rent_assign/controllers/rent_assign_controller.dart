import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:house_management/app/models/flat_type_model.dart';
import 'package:house_management/app/models/rent_assign_model.dart';

import '../../../models/create_flat_model.dart';
import '../../../models/flat_floor_model.dart';
import '../../../models/flat_no_model.dart';
import '../../../models/flat_size_model.dart';
import '../../../routes/app_pages.dart';

class RentAssignController extends GetxController {
  final count = 0.obs;

  String dropdownRentTypeValue = 'Select Rent Type';

  String? datePicker;
  String? timePicker;

  TextEditingController rentNameController = TextEditingController();
  TextEditingController rentPhoneController = TextEditingController();
  TextEditingController rentAddressController = TextEditingController();
  TextEditingController rentJobController = TextEditingController();
  TextEditingController rentJobInfoController = TextEditingController();
  TextEditingController rentAdvanceAmountController = TextEditingController();

  TextEditingController flatAmountController = TextEditingController();
  TextEditingController flatServiceController = TextEditingController();
  TextEditingController flatWaterBillController = TextEditingController();
  TextEditingController flatGasBillController = TextEditingController();


  /// flat No
  final dropdownFlatValue = 'B1'.obs;
  final flatID = ''.obs;
  final flatValue = ''.obs;

  final flatInfo=CreateFlatModel.name().obs;
  final _flats = <CreateFlatModel>[].obs;

  List<CreateFlatModel> get flatList => _flats;

  /// flat No
  final dropdownFlatNoValue = 'A1'.obs;
  final flatNoID = ''.obs;
  final flatNoValue = ''.obs;
  final _flatNos = <FlatNoModel>[].obs;
  List<FlatNoModel> get flatNoList => _flatNos;

  /// flat Type
  final dropdownFlatTypeValue = 'Family'.obs;
  final flatTypeID = ''.obs;
  final flatTypeValue = ''.obs;
  final _flatTypes = <FlatTypeModel>[].obs;
  List<FlatTypeModel> get flatTypeList => _flatTypes;

  /// Flat Floor
  final dropdownFlatFloorValue = '2nd floor'.obs;
  final flatFloorID = ''.obs;
  final flatFloorValue = ''.obs;
  final _flatFloors = <FlatFloorModel>[].obs;
  List<FlatFloorModel> get flatFloorList => _flatFloors;

  /// Flat assign
  final dropdownFlatAssignValue = 'ground floor'.obs;
  final flatAssignID = ''.obs;
  final flatAssignValue = ''.obs;
  final _flatAssigns = <CreateFlatModel>[].obs;
  List<CreateFlatModel> get flatAssignList => _flatAssigns;

  /// Flat Size
  final dropdownFlatSizeValue = '1400 sq fit'.obs;
  final flatSizeID = ''.obs;
  final flatSizeValue = ''.obs;
  final _flatSizes = <FlatSizeModel>[].obs;
  List<FlatSizeModel> get flatSizeList => _flatSizes;

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

  flatNo(List<FlatNoModel> data) {
    _flatNos.value = data;
  }

  flats(List<CreateFlatModel> data) {
    _flats.value = data;
  }

  flatType(List<FlatTypeModel> data) {
    _flatTypes.value = data;
  }

  flatFloor(List<FlatFloorModel> data) {
    _flatFloors.value = data;
  }

  flatSize(List<FlatSizeModel> data) {
    _flatSizes.value = data;
  }

  /// testing
  rentAssignFlat() async {

    String name =rentNameController.text;
    String phone =rentPhoneController.text;
    String address =rentAddressController .text;
    String job =rentJobController.text;
    String jobInfo = rentJobInfoController .text;
    String advanceAmount = rentAdvanceAmountController.text;
    String amount = flatAmountController .text;
    String serviceBill = flatServiceController.text ;
    String waterBill = flatWaterBillController.text;
    String gasBill= flatGasBillController.text;




    print('RentAssignController.rentAssignFlat');

    final db = FirebaseFirestore.instance;
    final refKey = db.collection('Rent_Assign_Confirm').doc();

        RentAssignModel rentAssignModel = RentAssignModel(
          createFlatID: flatInfo.value.createFlatID,
          rentAssignID: refKey.id,
          flatNoID: flatInfo.value.createFlatID,
          flatRoomID: '',
          flatSizeID: flatInfo.value.flatSizeId,
          rentName: name,
          rentPhone: phone,
          rentAddress: address,
          jobAddress: address,
          jobInfo: jobInfo,
          advanceAmount: advanceAmount,
          joiningDate: '1/5/2023',
          joiningTime: '12:01PM',
          isCheckPolicy: '',
          profilePath: '',
          nidBackEnd: '',
          nidFontEnd: '',
          roleAdminID: '', //rent
          roleRentOwnerID: flatInfo.value.roleID,
          dueAmount: '0.0',
          status: 'Pending',
          flatTypeID: '',
          rentDefaultPassword: '123456',
          createdAT: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await refKey.set(rentAssignModel.toJson()).then((value) {
          flatAmountController.clear();
          flatServiceController.clear();
          flatGasBillController.clear();
          flatWaterBillController.clear();
          Get.toNamed(Routes.RENT_ASSIGN_CONFIRM);
          log("creating flat  has successfully!");
        }, onError: (e) => log("Error booking appointment: $e"));


  }
}
