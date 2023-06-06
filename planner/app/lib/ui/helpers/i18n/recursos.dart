

import 'package:flutter/widgets.dart';

import 'strings/strings.dart';

class R {
  static Traducao string = PtBr();
  static void load(Locale locale) {
    switch (locale.toString()) {
      default:
        string = PtBr();
        break;
    }
  }
}
