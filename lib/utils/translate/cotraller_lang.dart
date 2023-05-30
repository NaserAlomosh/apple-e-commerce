import 'package:final_shop/utils/lang/ar.dart';
import 'package:final_shop/utils/lang/en.dart';
import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'en': en,
      };
}
