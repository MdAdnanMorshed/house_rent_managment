import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../values/app_colors.dart';
import '../values/app_space.dart';

class Helpers {
  Helpers._();

  static AppBar customAppbar(String title) {
    return AppBar(
      backgroundColor: Get.theme.primaryColor,
      centerTitle: false,
      scrolledUnderElevation: 0.0,
      title: Text(
        title.tr,
        style: Get.theme.appBarTheme.titleTextStyle,
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          Icons.arrow_back,
          color: Get.theme.iconTheme.color,
        ),
      ),
    );
  }

  static BoxDecoration createButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      // border: Border.all(
      //   color: Colors.black26,
      // ),
      color: Colors.grey.withOpacity(0.13),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   ),
      // ]
    );
  }

  static BoxDecoration customCircularDecoretion(
      BuildContext context, Color? color, double value) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(value),
    );
  }

  static BoxDecoration createDropdownButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      // border: Border.all(
      //   color: Colors.black26,
      // ),
      color: Colors.white,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   ),
      // ]
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static void snackbarForErorr({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        backgroundColor: AppColors.red.withOpacity(0.9),
        colorText: Colors.white);
  }

  static void snackbarForSucess({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        // backgroundColor: fromHex('#E9A9AF'),
        backgroundColor: Colors.black,
        colorText: Colors.white);
  }

  static void showSnackBarBuild(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: Get.theme.primaryColor,
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String checkCardNumber(String cardnumber) {
    String number = "";

    final String stripped = cardnumber.replaceAll(RegExp(r'[^\d]'), '');
    if (stripped.length > 8) {
      final String middle = cardnumber.substring(4, 6).trim();
      final String middle1 = cardnumber
          .substring(6, cardnumber.length - 8)
          .trim()
          .replaceAll(RegExp(r'\d'), 'X');
      final String middle2 = cardnumber
          .substring(8, cardnumber.length - 4)
          .trim()
          .replaceAll(RegExp(r'\d'), 'X');
      number = stripped.substring(0, 4) +
          " " +
          middle +
          "" +
          middle1 +
          " " +
          middle2 +
          ' ' +
          stripped.substring(stripped.length - 4);
    }

    return number;
  }

  static String cardMaskingStart(String cardnumber) {
    String number = "";

    final String stripped = cardnumber.replaceAll(RegExp(r'[^\d]'), '');
    if (stripped.length > 8) {
      final String middle = cardnumber
          .trim()
          .substring(6, cardnumber.length - 4)
          .replaceAll(RegExp(r'\d'), '*')
          .replaceAll(" ", "");

      number = stripped.substring(0, 6) +
          middle +
          stripped.substring(stripped.length - 4);
    }
    return number.trim();
  }

  //
  static openDialog(void Function()? onPressed) {
    Get.dialog(
      AlertDialog(
        //title: const Text('Are Yor Sure?'),

        elevation: 0.0,
        titlePadding: EdgeInsets.zero,
        // content: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     AppSpace.spaceH10,
        //     const Text(
        //       "আপনাকে লগইন করতে হবে।\n আপনি কি রাজি?",
        //       textAlign: TextAlign.center,
        //     ),
        //   ],
        // ),
        //আপনাকে লগইন করতে হবে।\n আপনি কি রাজি?
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSpace.spaceH20,
              const Text(
                "You need to login to use this \nFeature",
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        minimumSize: const Size(80, 20),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        textStyle: const TextStyle(
                          fontSize: 15,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: const Text(
                        "No",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Get.theme.primaryColor,
                        minimumSize: const Size(80, 20),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        textStyle: const TextStyle(fontSize: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: const Text("Yes",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  //passwordVisivilityMethod
  static IconButton passwordVisivilityMethod(
      void Function()? onPressed, bool isVisible) {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: onPressed,
      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  static Text appDiveder() {
    return Text(
      "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
      style: TextStyle(color: Colors.grey.shade300),
      maxLines: 1,
      overflow: TextOverflow.visible,
    );
  }
}

extension HexColorApp on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension StringToInt on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension FancyNum on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}

extension ExtendedString on String {
  bool get isValidName {
    return !this.contains(RegExp(r'[0–9]'));
  }
}

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Widget titleTextWidget({required String text}) {
  return Text(
    text.tr,
    style: Get.textTheme.caption!,
  );
}

Widget insideBodyText({required String text}) {
  return Text(
    text,
    style: Get.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 14, color: HexColor('#505050')),
  );
}

ButtonStyle elevatedButtonStyleCustom() => ElevatedButton.styleFrom(
      backgroundColor: Get.theme.primaryColor,
      minimumSize: Size(Get.width, 40),
      padding: const EdgeInsets.symmetric(vertical: 15),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

// WillPopScopeForStopBackspace

class WillPopScopeForStopBackspace extends StatelessWidget {
  const WillPopScopeForStopBackspace({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: child,
    );
  }
}
