import 'dart:ffi';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:house_management/app/core/helpers/app_helper.dart';
import 'package:house_management/app/core/theme/style_text.dart';
import 'package:house_management/app/core/values/app_colors.dart';
import 'package:house_management/app/global_widgets/custom_text_field.dart';
import 'package:house_management/app/routes/app_pages.dart';
import '../../../data/db_firebase/db_friebase_chat.dart';
import '../../../models/chat_model.dart';
import '../controllers/live_chat_controller.dart';

class LiveCHatView extends GetView<LiveChatController> {
  const LiveCHatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body:
        _buildBody(context)

      ),
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<LiveChatController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child: Text('Message Here '),
                    color: Colors.grey,
                    height: 500,width: double.infinity,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomTextField(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          decoration: Helpers.customCircularDecoretion(
                              context, AppColors.grey.withOpacity(0.2), 10),
                          hintText: 'Message',
                          style: AppTextStyle.labelSmall,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            print('Send Message ');
                           // _sendMessage();
                            final DatabaseReference _messagesRef = FirebaseDatabase.instance.reference().child('messages');
                            Message message= Message('Hello',DateTime.now());
                            _messagesRef.push().set(message.toJson());

                          },
                          child: Container(
                            height: 50,
                            width: Get.width,
                            alignment: Alignment.center,
                            decoration: Helpers.customCircularDecoretion(
                                context, AppColors.primaryColor, 10),
                            child: Text(
                              'Send',
                              style: AppTextStyle.button,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void _sendMessage() {
    final messageDao = MessageDao();
      final message = Message('Adnan', DateTime.now());
      messageDao.saveMessage(message);


  }

  Widget _getMessageList() {
    final messageDao = MessageDao();
    return Expanded(
      child: FirebaseAnimatedList(

        query: messageDao.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final message = Message.fromJson(json);
          return Text('Check Chat : ${message.text}');
        },
      ),
    );
  }
}
