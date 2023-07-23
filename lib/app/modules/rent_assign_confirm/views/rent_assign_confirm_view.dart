


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import '../controllers/rent_assign_confirm_controller.dart';

class RentAssignConfirmView extends GetView<RentAssignConfirmController> {
  const RentAssignConfirmView({Key? key}) : super(key: key);
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
            'RENT OWNER ASSIGN CONFIRM ',
            style: TextStyle(color: Colors.black,fontSize: 12),
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

  _buildBody(BuildContext context) {
    return GetBuilder<RentAssignConfirmController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child:     SizedBox(
                height: 700,
                child: ListView(
                  children: [
                    _showAssignConfirmDataTable(context)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  SingleChildScrollView _showAssignConfirmDataTable(BuildContext context) {
    return
      SingleChildScrollView(
          physics: const  BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child:DataTable(
              dividerThickness: 2,
              dataRowHeight: 40,
              columnSpacing: 20,

              showBottomBorder: true,
              columns: _createColumns(), rows: _createRows(context))
      );

  }
  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('ID')),
      DataColumn(label: Text('Flat ')),
      DataColumn(label: Text('Amount')),
      DataColumn(label: Text('Status')),
      DataColumn(label: Text('Date')),
      DataColumn(label: Text('Active')),
    ];
  }
  List<DataRow> _createRows(BuildContext context) {
    return [
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('1/4/2023')),
        DataCell(Row(children: [
          Icon(Icons.delete_forever,color: AppColors.red,),
          SizedBox(width: 10 ),
          Icon(Icons.edit,color:AppColors.primaryColor,),

        ],)),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('1/4/2023')),
        DataCell(Row(children: [
          Icon(Icons.delete_forever,color: AppColors.red,),
          SizedBox(width: 10 ),
          Icon(Icons.edit,color:AppColors.primaryColor,),

        ],)),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('1/4/2023')),
        DataCell(Row(children: [
          Icon(Icons.delete_forever,color: AppColors.red,),
          SizedBox(width: 10 ),
          Icon(Icons.edit,color:AppColors.primaryColor,),

        ],)),

      ]),
      DataRow(cells: [
        DataCell(Text('#100')),
        DataCell(Text('January ')),
        DataCell(Text('150000')),
        DataCell(Text('Pending')),
        DataCell(Text('1/4/2023')),
        DataCell(Row(children: [
          Icon(Icons.delete_forever,color: AppColors.red,),
          SizedBox(width: 10 ),
          Icon(Icons.edit,color:AppColors.primaryColor,),

        ],)),

      ]),
      DataRow(cells: [
        const DataCell(Text('#100')),
        const DataCell(Text('January ')),
        const DataCell(Text('150000')),
        const DataCell(Text('Pending')),
        const DataCell(Text('1/4/2023')),
        DataCell(Row(children: [
          InkWell(
              onTap: (){
                print('RentAssignConfirmView._createRows Delete');
                  assignConfirmDeleteAlert(context);
              },
              child: Icon(Icons.delete_forever,color: AppColors.red,)),
          AppSpace.spaceW14,
          Icon(Icons.edit,color:AppColors.primaryColor,),

        ],)),

      ]),


    ];
  }


  Future<void> assignConfirmDeleteAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
          //Image.asset( 'assets/images/font-nid.jpg'),
          Text('Are you Sure Do you want to delete ? ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
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
