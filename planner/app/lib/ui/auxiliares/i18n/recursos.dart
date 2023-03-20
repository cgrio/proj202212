import 'package:app/ui/auxiliares/i18n/strings/pt_br.dart';
import 'package:app/ui/auxiliares/i18n/strings/traducoes.dart';
import 'package:flutter/widgets.dart';

class R {
  static Traducoes string = PtBr();
  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = PtBr();
        break;
    }
  }
}
