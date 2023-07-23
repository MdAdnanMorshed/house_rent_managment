import 'from/bn_bd.dart';
import 'from/en_us.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "bn": bnBd,
    //"pt": pt,
  };
}

// final selectedLanguage = Get.locale!.languageCode.obs;
// var selectIndex = 0.obs;
  // void changeLanguage(String lang, int index) async {
  //   // print('language: ' + lang);
  //   // selectIndex.value = index;
  //   // await appCon.getLanguageInfo(lang);

  //   Locale locale = Locale(lang);
  //   Get.updateLocale(locale);
  //   selectedLanguage.value = lang;
  //   selectIndex.value = index;
  //   await preferences.setString(AppKeys.languageCode, lang.toString());
  // }
