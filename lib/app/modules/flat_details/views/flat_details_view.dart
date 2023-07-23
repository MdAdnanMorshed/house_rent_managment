import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/theme/style_text.dart';

import '../../../core/helpers/app_helper.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_space.dart';
import '../../../routes/app_pages.dart';
import '../controllers/flat_details_controller.dart';

class FlatDetailsView extends GetView<FlatDetailsController> {
  const FlatDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        elevation: 0.2,
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      body: _buildBody(context, controller),
    );
  }

  _buildBody(
      BuildContext context, FlatDetailsController flatDetailsController) {
    return GetBuilder<FlatDetailsController>(
      //initState: (_) {},
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSpace.spaceH4,
              _detailsTitleContainer(context, flatDetailsController),
              AppSpace.spaceH4,

              InkWell(
               onTap: (){
                 print('FlatDetailsView._buildBody');
                 Get.toNamed(Routes.RENT_ASSIGN);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 8),
                  decoration: Helpers.customCircularDecoretion(
                      context, AppColors.appcolor, 5),
                  child: Center(
                    child: Text(
                      "House owner assignment form rent ",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              AppSpace.spaceH4,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                decoration: Helpers.customCircularDecoretion(
                    context, AppColors.appcolor, 5),
                child: Center(
                  child: Text(
                    "House Rent Summery ",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              houseRentSummeryTable(),
          /*    Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Property Type",
                  style: AppTextStyle.labelLarge,
                ),
              ),
              AppSpace.spaceH4,
              _propertyType(flatDetailsController),
              AppSpace.spaceH4,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Bedrooms",
                  style: AppTextStyle.labelLarge,
                ),
              ),
              AppSpace.spaceH4,
              _bedrooms(flatDetailsController),
              AppSpace.spaceH4,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Tenants Preferred",
                  style: AppTextStyle.labelLarge,
                ),
              ),
              AppSpace.spaceH4,
              _tenantsPreferred(),*/
              
            ],
          ),
        );
      },
    );
  }

  

   _propertyType(FlatDetailsController flatDetailsController) {
    return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 100,
                width: double.maxFinite,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 239, 242, 247),
                ),
                child: ListView.builder(
                  itemCount: flatDetailsController.propertyTypeList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(5),
                        color:
                            flatDetailsController.propertyTypeList[index] == "Flat"
                                ?const Color(0xffFFDEB4)
                                : AppColors.white,
                        alignment: Alignment.center,
                        child: Text(
                          flatDetailsController.propertyTypeList[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
  }
  _bedrooms(FlatDetailsController flatDetailsController) {
    return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 60,
                width: Get.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 239, 242, 247),
                ),
                child: ListView.builder(
                  itemCount: flatDetailsController.bedroomsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 40,
                        width: 80,
                        padding: const EdgeInsets.all(5),
                        color:
                            flatDetailsController.bedroomsList[index] == "3 BR"
                                ? const Color(0xffFFDEB4)
                                : AppColors.white,
                        alignment: Alignment.center,
                        child: Text(
                          flatDetailsController.bedroomsList[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
  }

  // _detailsTitleContainer
  _detailsTitleContainer(
      BuildContext context, FlatDetailsController flatDetailsController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        height: 210,
        width: double.maxFinite,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 239, 242, 247),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 8),
                  decoration: Helpers.customCircularDecoretion(
                      context, AppColors.appcolor, 5),
                  child: Text(
                    "Flat No",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                AppSpace.spaceH10,

                Text("Floor", style: AppTextStyle.titleLarge),
                AppSpace.spaceH10,
                Text("Rent", style: AppTextStyle.titleLarge),
                AppSpace.spaceH10,
                Text("Payment Date", style: AppTextStyle.titleLarge),
                AppSpace.spaceH10,
                Text("Payment Status", style: AppTextStyle.titleLarge),
                AppSpace.spaceH10,


              ],
            ),
            Column(
              children: [

                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "A1",
                    style: TextStyle(
                      color: AppColors.appcolor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                AppSpace.spaceH10,
                Text("4th", style: AppTextStyle.titleLarge),
                AppSpace.spaceH10,
                Text("15000", style: AppTextStyle.titleLarge),
                AppSpace.spaceH10,
                Text("07/05/2023", style: AppTextStyle.titleSmall.copyWith(color: Colors.green,)),
                AppSpace.spaceH10,
                Text("Paid", style: AppTextStyle.titleLarge.copyWith(color: Colors.green,)),


              ],
            ),
          ],
        ),
      ),
    );
  }
   _tenantsPreferred() {
    return Container(
              height: 80,
              width: Get.width,
              padding: const EdgeInsets.all(8.0),
              color: const Color.fromARGB(255, 239, 242, 247),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      color: AppColors.white,
                      child: const Text("Bachelors"),
                    ),
                  ),
                  AppSpace.spaceW8,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      
                      alignment: Alignment.center,
                      color: const Color(0xffFFDEB4),
                      child: const Text("Family"),
                    ),
                  ),
                ],
              ),

            );
  }

  //
  _usedProductView(FlatDetailsController flatDetailsController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Details",
          style: Get.theme.textTheme.labelLarge,
        ),
        AppSpace.spaceH10,
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 170,
                width: Get.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: Helpers.customCircularDecoretion(
                    context, const Color.fromARGB(255, 239, 242, 247), 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpace.spaceH10,
                    Text(
                      "asd",
                      style: Get.theme.textTheme.labelSmall,
                    ),
                    Divider(color: Colors.grey.shade300),
                    AppSpace.spaceH4,

                    AppSpace.spaceH10,
                    // out qty
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Out Qty",
                          style: Get.theme.textTheme.labelSmall,
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          decoration: Helpers.customCircularDecoretion(
                              context, Colors.white, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {},
                                child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 239, 242, 247),
                                  radius: 22,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                              Text(
                                "sdd",
                                style: Get.theme.textTheme.labelLarge,
                              ),
                              InkWell(
                                onTap: () {},
                                child: const CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 239, 242, 247),
                                  radius: 22,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }


  houseRentSummeryTable(){
    return Container(
      height: 500,
      child: ListView(
        children: [
          _createDataTable()
        ],
      ),
    );
  }

  SingleChildScrollView _createDataTable() {
    return
      SingleChildScrollView(
        physics: const  BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child:DataTable(
            dividerThickness: 1,
            dataRowHeight: 40,
            columnSpacing: 20,
            showBottomBorder: true,
            columns: _createColumns(), rows: _createRows())
      );

  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Months')),
      DataColumn(label: Text('Amount')),
      DataColumn(label: Text('Status')),
      DataColumn(label: Text('Date')),
    ];
  }
  List<DataRow> _createRows() {
    return [
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('2-2-2023')),

      ]),




    ];
  }


}
