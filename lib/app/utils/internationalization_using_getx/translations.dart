import 'package:flutter_boiler_plate/app/utils/internationalization_using_getx/preferred_language_mapping.dart';
import 'package:flutter_boiler_plate/app/utils/internationalization_using_getx/tr_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

PreferredLanguageMapping selectedPreferredLanguageMapping = preferredLanguageList[0];

Future<void> loadPreferredLanguageFromLocalDb() async {
  try {
    final box = GetStorage();
    int? languageId = box.read('languageId');
    if (languageId != null) {
      selectedPreferredLanguageMapping = preferredLanguageList.firstWhere((element) => element.languageId == languageId);
    }
  } catch (error) {}
}

Future<void> changeLanguageAndStoreInLocalDb({required PreferredLanguageMapping preferredLanguageMapping}) async {
  try {
    if (preferredLanguageMapping == selectedPreferredLanguageMapping) return;
    selectedPreferredLanguageMapping = preferredLanguageMapping;
    Get.updateLocale(Locale(preferredLanguageMapping.languageCode, preferredLanguageMapping.countryCode));
    final box = GetStorage();
    await box.write('languageId', preferredLanguageMapping.languageId);
  } catch (error) {}
}

class TranslationsClass extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _enMap(),
        'es_ES': _esMap(),
      };
}

Map<String, String> _enMap() {
  Map<String, String> data = {};
  for (TrKeys keyName in TrKeys.values) {
    data[keyName.name] = keyName.en;
  }
  return data;
}

Map<String, String> _esMap() {
  Map<String, String> data = {};
  for (TrKeys keyName in TrKeys.values) {
    data[keyName.name] = keyName.es;
  }
  return data;
}
