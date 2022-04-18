import "package:flutter/material.dart";

class SizeUtil {
  SizeUtil._();

  static late BuildContext _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static double _designHeight = 772;
  static double _designWidth = 360;

  static double height(num widgetSize) {
    return (_designHeight / MediaQuery.of(_context).size.height) * widgetSize;
  }

  static double width(num widgetSize) {
    return (_designWidth / MediaQuery.of(_context).size.width) * widgetSize;
  }

  static double textSize(num widgetSize) {
    return (_designWidth / MediaQuery.of(_context).size.width) * widgetSize;
  }
}

extension SizeUtilExtension on num {
  double get h => SizeUtil.height(this);
  double get w => SizeUtil.width(this);
  double get sp => SizeUtil.textSize(this);
}
