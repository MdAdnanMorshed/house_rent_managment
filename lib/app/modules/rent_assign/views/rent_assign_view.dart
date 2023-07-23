
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/routes/app_pages.dart';
import '../../../global_widgets/chevron_painter.dart';
import '../../../global_widgets/separator_dotline_widget.dart';
import '../controllers/rent_assign_controller.dart';
import 'package:date_time_picker_widget/date_time_picker_widget.dart';

import 'package:intl/intl.dart';
class RentAssignView extends GetView<RentAssignController> {
  const RentAssignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          elevation: 0.2,
          title: const Text(
            'RENT OWNER ASSIGN FORM RENTER ',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GetBuilder<RentAssignController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [


                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/assign.jpg',
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: 120),
                  ),
                  AppSpace.spaceH14,

                  Text(
                    'Flat Information',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  AppSpace.spaceH14,
                  const SeparatorDotLineWidget(),
                  AppSpace.spaceH14,
                  _selectRentTypeDropDown(context, _),
                  AppSpace.spaceH14,
                  _selectRentFlatDropDown(context, _),
                  AppSpace.spaceH14,
                  _selectFlatRoomDropDown(context, _),
                  AppSpace.spaceH14,
                  Text(
                    'Renter Personal Information',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  AppSpace.spaceH14,
                  const SeparatorDotLineWidget(),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.rentNameController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Rent Name".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.rentPhoneController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Rent Phone".tr,
                    style: AppTextStyle.labelSmall,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.rentAddressController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "permanent address".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.rentJobController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Job Name".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.rentJobInfoController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Job Info ".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  CustomTextField(
                    controller: _.rentAddressController,
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.grey.withOpacity(0.2), 10),
                    hintText: "Advance Amount  ".tr,
                    style: AppTextStyle.labelSmall,
                    keyboardType: TextInputType.number,
                  ),
                  AppSpace.spaceH14,
                  _dateTimePicker(context),


                  AppSpace.spaceH14,
                  Text(
                    'Renter Personal Documentation',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  AppSpace.spaceH14,
                  const SeparatorDotLineWidget(),
                  AppSpace.spaceH14,

                  _rentProfileImage(context),
                  AppSpace.spaceH14,
                  _rentNIDImage(context),
                  AppSpace.spaceH14,
                  _isCheckTermsCondition(),
                  AppSpace.spaceH16,
                  InkWell(
                    onTap: () {
                      String rentName = _.rentNameController.text;
                      String rentPhone = _.rentPhoneController.text;
                      String permanentAddress = _.rentAddressController.text;
                      String jobTitle = _.rentJobController.text;
                      String jobInfo = _.rentJobInfoController.text;
                      String advanceAmount = _.rentAdvanceAmountController.text;

                      String flatType = _.dropdownRentTypeValue;
                      String flatNo = _.dropdownFlatNoValue;
                      String flatRoom = _.dropdownFlatRoomValue;
                      String joinDate='';
                      String joinTime='';
                      String profileImage='';
                      String backNIDImage='';
                      String fontNIDImage='';
                      bool isCheckTermsCondition=true;

                      Map<String, dynamic> createFlatMApBody = {
                        'rentType':flatType,
                        'flatNo': flatNo,
                        'flatRoom': flatRoom,
                        'rentName': rentName,
                        'rentPhone': rentPhone,
                        'permanentAddress': permanentAddress,
                        'jobTitle': jobTitle,
                        'jobInfo': jobInfo,
                        'advanceAmount': advanceAmount,
                        'joinDate': joinDate,
                        'joinTime': joinTime,
                        'profileImage': profileImage,
                        'backNIDImage': backNIDImage,
                        'fontNIDImage': fontNIDImage,
                        'isTermsCondition': isCheckTermsCondition,
                      };

                      print('CreateFlatView._buildBody $createFlatMApBody');

                      Get.toNamed(Routes.RENT_ASSIGN_CONFIRM);
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      alignment: Alignment.center,
                      decoration: Helpers.customCircularDecoretion(
                          context, AppColors.primaryColor, 10),
                      child: Text(
                        'Assign Rent'.tr,
                        style: AppTextStyle.button,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _selectRentTypeDropDown(BuildContext context, RentAssignController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownRentTypeValue,
          iconStyleData: const IconStyleData(
            iconSize: 22,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
          ),
          dropdownStyleData: DropdownStyleData(
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.white,
              ),
              elevation: 8,
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          items: <String>[
            'Select Rent Type',
            'Family',
            'Bachelor',
            'Purchase ',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyle.labelSmall,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            _.dropdownRentTypeValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

  Widget _selectRentFlatDropDown(BuildContext context, RentAssignController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownRentFlatValue,
          iconStyleData: const IconStyleData(
            iconSize: 22,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
          ),
          dropdownStyleData: DropdownStyleData(
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.white,
              ),
              elevation: 8,
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          items: <String>[
            'Select Flat',
            'A1',
            'A2',
            'A3',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyle.labelSmall,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            _.dropdownRentFlatValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

  Widget _selectFlatRoomDropDown(BuildContext context, RentAssignController _) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: Helpers.customCircularDecoretion(
          context, AppColors.grey.withOpacity(0.2), 10),
      padding: const EdgeInsets.only(right: 10, left: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          value: _.dropdownFlatRoomValue,
          iconStyleData: const IconStyleData(
            iconSize: 22,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
          ),
          dropdownStyleData: DropdownStyleData(
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.white,
              ),
              elevation: 8,
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              )),
          items: <String>['Select Flat Room', '1', '2', '3', '4', '5']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AppTextStyle.labelSmall,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            _.dropdownFlatRoomValue = newValue!;
            _.update();
          },
        ),
      ),
    );
  }

  Widget _rentNIDImage(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children: [


              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(5),
                dashPattern: [5,5],
                color: Colors.grey,
                strokeWidth: 0.9,
                padding: EdgeInsets.all(4),
                child: InkWell(
                  onTap: (){
                    _imageEditPickerCameraAndGalleryAlert(context);
                  },
                  child: Container(


                    decoration: BoxDecoration(

                        border: Border.all(color: AppColors.primaryColor,),
                        boxShadow: [
                          BoxShadow(color: AppColors.primaryColor.withOpacity(0.1), spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    height: 160,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/font-nid.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 7,
                top: 7,

                child: CustomPaint(
                  painter: Chevron(),

                  child: Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,

                     decoration: BoxDecoration(
                       color:AppColors.primaryColor.withOpacity(0.1),
                       borderRadius: BorderRadius.only(topRight: Radius.circular(10.1),bottomLeft: Radius.circular(5.1),bottomRight: Radius.circular(5.1)),
                     ),
                     

                    child: Align(
                      alignment: Alignment.center,

                      child:
                      Container(
                        alignment: Alignment.center,

                        color: AppColors.primaryColor.withOpacity(0.1),
                        child:
                        IconButton(
                          onPressed: () {
                            _imageEditPickerCameraAndGalleryAlert(context);
                            print('RentAssignView._rentNIDImage Edit');
                          },
                          icon: Icon( Icons.edit,color: AppColors.black,size: 20,),
                        ),

                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppSpace.spaceW10,
        Expanded(
          flex: 1,
          child: Stack(
            children: [


              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(5),
                dashPattern: [5,5],
                color: Colors.grey,
                strokeWidth: 0.9,
                padding: EdgeInsets.all(4),
                child: InkWell(
                  onTap: (){
                    _imagePickerCameraAndGalleryAlert(context);
                  },
                  child: Container(

                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8)),
                    height: 160,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' Back NID Image',style: TextStyle(fontWeight: FontWeight.w600),),
                        AppSpace.spaceH10,
                        CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ),
              ),
             
            ],
          ),


        ),
      ],
    );
  }

  Widget _rentProfileImage(BuildContext context) {
    return Stack(
      children: [


        DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(5),
          dashPattern: [5,5],
          color: Colors.grey,
          strokeWidth: 0.9,
          padding: EdgeInsets.all(4),
          child: InkWell(
            onTap: (){
              print('RentAssignView._rentProfileImage');
              _imagePickerCameraAndGalleryAlert(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              height: 160,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Personal Profile',style: TextStyle(fontWeight: FontWeight.w600),),
                  AppSpace.spaceH10,
                  CircleAvatar(
                    radius: 40,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.person_add_alt,size: 50,)),
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }

  Widget _isCheckTermsCondition() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Checkbox(
              value: true,
              onChanged: (bool? value) {
                print('RentAssignView._isCheckTermsCondition $value');
              },
            )),
        Expanded(flex: 8, child: Text('All Agree terms and condition')),
      ],
    );
  }

  Widget _dateTimePicker(BuildContext context) {
    final dt = DateTime.now();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DateTimePicker(

          initialSelectedDate: dt,
          startDate: dt.subtract(const Duration(days: 1)),
          endDate: dt.add(const Duration(days: 60)),
          startTime: DateTime(dt.year, dt.month, dt.day, 6),
          endTime: DateTime(dt.year, dt.month, dt.day, 18),
          timeInterval: const Duration(minutes: 2),
          datePickerTitle: 'Rent join date',
          timePickerTitle: 'Rent join time',
          timeOutOfRangeError: 'Sorry picker is not working ',
          is24h: false,
          numberOfWeeksToDisplay: 2,
          onDateChanged: (date) {
              controller.datePicker = DateFormat('dd MMM, yyyy').format(date);
              print('RentAssignView._dateTimePicker Time ${controller.datePicker}');
          },
          onTimeChanged: (time) {
              controller.timePicker = DateFormat('hh:mm:ss aa').format(time);
              print('RentAssignView._dateTimePicker Time ${controller.timePicker}');
          },
        )
      ],
    );
  }

  Future<void> _imagePickerCameraAndGalleryAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
          //Image.asset( 'assets/images/font-nid.jpg'),
          Text('Select Your Profile Image ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[

                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child:ElevatedButton(
                  style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.primaryColor)) ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:const [
                      Text('Camera'),
                      AppSpace.spaceW20,
                      Icon(Icons.camera_alt_rounded)
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),),
                AppSpace.spaceH16,
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child: ElevatedButton(
                  style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.primaryColor)) ,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:const [
                      Text('Gallery'),
                      AppSpace.spaceW20,
                      Icon(Icons.image)
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),),
                AppSpace.spaceH20,
                ElevatedButton(
                  style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.red)) ,

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:const [
                      Text('Cancel'),
                      AppSpace.spaceW20,
                      Icon(Icons.cancel)
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),

        );
      },
    );
  }

  Future<void> _imageEditPickerCameraAndGalleryAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
          Image.asset( 'assets/images/font-nid.jpg'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child:ElevatedButton(
                    style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.primaryColor)) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Text('Camera'),
                        AppSpace.spaceW20,
                        Icon(Icons.camera_alt_rounded)
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),),
                AppSpace.spaceH16,
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child: ElevatedButton(
                    style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.primaryColor)) ,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Text('Gallery'),
                        AppSpace.spaceW20,
                        Icon(Icons.image)
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),),
                AppSpace.spaceH20,
                ElevatedButton(
                  style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(Colors.red)) ,

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:const [
                      Text('Cancel'),
                      AppSpace.spaceW20,
                      Icon(Icons.cancel)
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}


