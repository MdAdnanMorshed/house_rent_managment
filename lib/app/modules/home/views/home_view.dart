import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/routes/app_pages.dart';
import '../../../global_widgets/chevron_painter.dart';
import '../../../global_widgets/custom_drawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return openDialog();
      },
      child: Scaffold(
        extendBody: true,
        key: controller.globalKey,
        backgroundColor: AppColors.white,
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          title: Text(
            'HomeView',
            style: AppTextStyle.labelLarge,
          ),
          centerTitle: true,
          backgroundColor: AppColors.white,
          elevation: 0.2,
          leading: IconButton(
              onPressed: () {
                controller.globalKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: AppColors.black,
              )),
        ),
        body:
       /* Container(
          height: 200,
          width: 400,
          color: Colors.green,
          alignment: Alignment.topRight,
          child: CustomPaint(
            painter: Chevron(),
            child: Container(
              width: 100,
             height: 100,

             // color: Colors.green,
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),   */
        _buildBody(),
        floatingActionButton:FloatingActionButton(
          shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.all(Radius.circular(15.0))
          ),
          onPressed: () {
            print('HomeView.build');
            Get.toNamed(Routes.CREATE_FLAT);
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.create_new_folder_rounded), //<-- SEE HERE
        ),

      ),
    );
  }

  _buildBody() {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Column(
          children: [
            AppSpace.spaceH4,
            _titleView(_),
            _flatListView(_),
          ],
        );
      },
    );
  }

  _flatListView(HomeController _) {
    return Flexible(
      child: GridView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: _.flatList.length,
        shrinkWrap: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 2,
            mainAxisExtent: 120,
            mainAxisSpacing: 2,
            crossAxisSpacing: 6),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.FLAT_DETAILS);
              },
              child:
              Container(
          height: 200,
          width: 400,

          alignment: Alignment.topRight,
          child: Stack(
           children: [
             Container(
               padding: const EdgeInsets.all(5),
               decoration: BoxDecoration(
                 color: _.flatList[index]['color'],
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   const BoxShadow(
                     color: Colors.white10,
                     spreadRadius: 2,
                     blurRadius: 3,
                     offset: Offset(2, 2),
                   ),
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.1),
                     spreadRadius: 2,
                     blurRadius: 3,
                     offset: const Offset(-1, -1),
                   ),
                 ],
               ),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     _customTitleKeyValue(
                         'Flat No', _.flatList[index]['flatNo']),
                     AppSpace.spaceH4,
                     _customTitleKeyValue('Floor', _.flatList[index]['flatFloor']),
                     AppSpace.spaceH4,
                     _customTitleKeyValue('Amount', _.flatList[index]['bill']),
                     AppSpace.spaceH4,
                     _customTitleKeyValue('Payment', _.flatList[index]['flatStatus']),
                   ],
                 ),
               ),
             ),
             Positioned(
               right: 0,
               top: 0,
               child: CustomPaint(
                 painter: Chevron(),

                 child: Container(
                   width: 40,
                   height: 40,

                   // color: Colors.green,
                   child: Align(
                     alignment: Alignment.center,

                     child: Container(

                       child:
                       IconButton(
                         onPressed: () {
                           print('HomeView._flatListView Flat Home Alert' );
                           flatEditDeleteAlertAlert(context);
                         },
                         icon: Icon(Platform.isAndroid ? Icons.more_vert : Icons.more_horiz,size: 30,color: Colors.black,),
                       ),

                     /*  Image.asset(
                         "assets/images/logo.png",
                         fit: BoxFit.cover,
                         height: 30,
                         width: 30,
                         color: Colors.black,
                       ),*/
                     ),
                   ),
                 ),
               ),
             ),

           ],
          ),
        ),


            ),
          );
        },
      ),
    );
  }

  _customTitleKeyValue(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            child: Text(
          key,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        )),
        Expanded(
            child: Text(' : $value',
                style: const TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w500))),
      ],
    );
  }

  _customTitleKeyNewLineValue(String key, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          key,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        AppSpace.spaceH4,
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      ],
    );
  }

  _titleView(HomeController _) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: _.flatSummery.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 100,
                width: 150,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white10,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(2, 2),
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(-1, -1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _customTitleKeyNewLineValue(
                        _.flatSummery[index]['summeryKey'],
                        _.flatSummery[index]['summeryValue']),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  openDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Are Yor Sure?'),
        content: const Text('Do you want to exit this App'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
                print("android>>>>");
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  Future<void> flatEditDeleteAlertAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
          //Image.asset( 'assets/images/font-nid.jpg'),
          Text('Alert ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[

                Text('Flat No  : D1'),
                Text('Flat Floor : 4th '),

                AppSpace.spaceH12,

                ConstrainedBox(
                  constraints: BoxConstraints.tightFor( height: 50),
                  child:ElevatedButton(
                    style:ButtonStyle(backgroundColor:  MaterialStateProperty.all(AppColors.primaryColor)) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:const [
                        Text('Update '),
                        AppSpace.spaceW20,
                        Icon(Icons.edit)

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
                        Text('Delete'),
                        AppSpace.spaceW20,
                        Icon(Icons.delete_forever)
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


