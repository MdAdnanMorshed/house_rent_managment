import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(

                    children: [
                      SizedBox(height: 10,),
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                        width: 200,
                        height: 150,
                      ),
                      Text('Main Features',style: TextStyle(fontSize: 30,color: Colors.red),),
                      Divider(
                        height: 5,
                        thickness: 5,
                        color: Colors.grey,


                      ),

                      Text('1. Create House '),
                      Text('2. Create Flat'),
                      Text('3. Flat Assign by Rentwer'),
                      Text('more Info..'),
                      Text('1. Create House '),
                      Text('1. Create House dfggggggggggggg'),
                      Text('1. Create House '),
                      Text('1. Create House '),
                      Text('1. Create Housefgffffffff '),
                      Text('1. Create House '),
                      Text('2. Create Flat'),
                      Text('3. Flat Assign by Rentwer'),
                      Text('more Info..'),
                      Text('1. Create House '),
                      Text('2. Create Flat'),
                      Text('3. Flat Assign by Rentwer'),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: Get.width - 30,
                    alignment: Alignment.center,
                    decoration: Helpers.customCircularDecoretion(
                        context, AppColors.primaryColor, 10),
                    child: Text(
                      'Welcome '.tr,
                      style: AppTextStyle.button,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/images/house_rent_bg.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            opacity: const AlwaysStoppedAnimation(.2),
          ),
        ]),
      ),
    );
  }
}
