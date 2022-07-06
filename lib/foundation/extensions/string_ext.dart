import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';

extension StringExt on String {
  bool get isBlank => trim().isEmpty;

  // String get tr {
  //   try {
  //     return el.tr(this);
  //   } catch (e) {
  //     return this;
  //   }
  // }
}

extension ContextExt on BuildContext {
  String tr(String key) {
    try {
      return el.tr(key);
    } catch (e) {
      return key;
    }
  }
}
