import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/values/app_space.dart';
import 'package:house_management/app/routes/app_pages.dart';

import '../../../core/helpers/app_helper.dart';
import '../../../core/theme/style_text.dart';
import '../../../core/values/app_colors.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: Alignment.center, children: [


          Image.asset(
            'assets/images/house_rent_bg.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            opacity: const AlwaysStoppedAnimation(.2),
          ),

            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    AppSpace.spaceH20,
                    Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                      width: 200,
                      height: 150,
                    ),
                    Text(
                      'Main Features',
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                    AppSpace.spaceH10,
                    Text('1. Create House '),
                    Text('2. Create Flat',style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text('3. Flat Assign by Rentwer',style: TextStyle(fontWeight: FontWeight.bold,)),
                    Text('3. Flat Assign by Rentwer',style: TextStyle(fontWeight: FontWeight.bold,)),
                    Text('3. Flat Assign by Rentwer',style: TextStyle(fontWeight: FontWeight.bold,)),
                    Text('3. Flat Assign by Rentwer',style: TextStyle(fontWeight: FontWeight.bold,)),
                    Text('3. Flat Assign by Rentwer',style: TextStyle(fontWeight: FontWeight.bold,)),
                    Text('3. Flat Assign by Rentwer',style: TextStyle(fontWeight: FontWeight.bold,)),
                   ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    print('WelcomeView.build');
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    height: 50,


                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.primaryColor, 10),
                    child: Center(
                      child: Text(
                        'Welcome '.tr,
                        style: AppTextStyle.button,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ]),
      ),
    );
  }
}
