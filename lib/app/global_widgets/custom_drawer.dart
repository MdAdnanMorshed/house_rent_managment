import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_management/app/modules/login/views/login_view.dart';
import '../core/values/app_colors.dart';
import '../modules/home/controllers/home_controller.dart';
import '../routes/app_pages.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,


            decoration: const BoxDecoration(
              color: AppColors.appcolor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      const AssetImage("assets/images/logo.png"),
                  backgroundColor: Colors.white.withOpacity(0.5),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Mannan Plaza House ',
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),

              ],
            ),
          ),
          drawerMenuItem(context, homeController),
        ],
      ),
    );
  }

  drawerMenuItem(BuildContext context, HomeController homeController) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItemWithClick(
                itemName: 'Home',
                icon: Icons.dashboard,
                onClick: () {
                  Get.back();
                  print("Click");
                },
              ),
              MenuItemWithClick(
                itemName: 'Notice Board',
                icon: Icons.add_alert_rounded,
                onClick: () {
                  /*Navigator.of(context).pop();
                  homeController.selectedIndex = 1;
                  homeController.updateState();*/
                },
              ),
              MenuItemWithClick(
                itemName: 'Reports',
                icon: Icons.auto_graph_outlined,
                onClick: () {
                /*  Navigator.of(context).pop();
                  homeController.selectedIndex = 1;
                  homeController.updateState();*/
                },
              ),

              const SizedBox(height: 15),
              const Text("LEGALS & SUPPORT"),
              const Divider(color: Colors.grey, height: 30),

              MenuItemWithClick(
                itemName: 'Contact Us',
                icon: Icons.contact_phone,
                onClick: () {
                  print('Testing1');
                  print("Click");
                },
              ),
              MenuItemWithClick(
                itemName: 'Live Chat',
                icon: Icons.chat,
                onClick: () {
                 Get.toNamed(Routes.RENT_RENTOWNER_CHAT);
                },
              ),
              MenuItemWithClick(
                itemName: 'Terms & Conditions',
                icon: Icons.event_note_sharp,
                onClick: () {
                  print(' Terms & Conditions Page ');
                  print("Click");
                },
              ),
              MenuItemWithClick(
                itemName: 'Privacy Policy',
                icon: Icons.privacy_tip,
                onClick: () {
                  print(' Privacy Policy Page ');

                  print("Click");
                },
              ),
              MenuItemWithClick(
                itemName: 'Logout',
                icon: Icons.restart_alt,
                onClick: () {
                  Get.to(LoginView());
                  print(' Privacy Policy Page ');

                  print("Click");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWithClick extends StatelessWidget {
  final String itemName;
  final IconData icon;
  //Function onClick;
  final void Function()? onClick;
  const MenuItemWithClick({
    Key? key,
    required this.itemName,
    required this.icon,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
      visualDensity: const VisualDensity(vertical: -3),
      horizontalTitleGap: 10,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: Text(itemName, textAlign: TextAlign.left),
      leading: Icon(icon, color: Color(0xff3A98B9)),
      onTap: onClick
      /*{
        Get.toNamed(Routes.FAQ);
      }*/
      ,
    );
  }
}
