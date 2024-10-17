import 'package:flutter/material.dart';

import 'package:get/get.dart';
class MediaQueryUtil {
  static late double screenWidth;
  static late double screenHeight;


  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    
  }
}

/// These are the Viewport values of your Figma Design.
/// These are used in the code as a reference to create your UI Responsively.
const num FIGMA_DESIGN_WIDTH = 390.0;
const num FIGMA_DESIGN_HEIGHT = 844.0;
const num FIGMA_DESIGN_STATUS_BAR = 0;

/// This extension is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
extension ResponsiveExtension on num {
  /// This method is used to get device viewport width.
  double get h {
    return (this * MediaQuery.of(Get.context!).size.width) / FIGMA_DESIGN_WIDTH;
  }

  /// This method is used to get device viewport height.
  double get v {
    var statusBar = MediaQuery.of(Get.context!).viewPadding.top;
    var bottomBar = MediaQuery.of(Get.context!).viewPadding.bottom;
    var screenHeight = MediaQuery.of(Get.context!).size.height - statusBar - bottomBar;
    return (this * screenHeight) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);
  }

  /// This method is used to set smallest px in image height and width
  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  /// This method is used to set text font size according to Viewport
  double get fSize => adaptSize;
}

extension FormatExtension on double {
  /// Return a [double] value with formatted according to provided fractionDigits
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }
}
