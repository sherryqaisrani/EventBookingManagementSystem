import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';

class SuggestionAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late Animation<double> progressAnimation;
  late AnimationController progressAnimcontroller;
  late double beginWidth = 0.0;
  late double growStepWidth, endWidth = 0.0;
  int totalPages = 6;

  @override
  void onInit() {
    progressAnimcontroller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
        .animate(progressAnimcontroller)
      ..addListener(() {
        update();
      });

    setProgressAnim(0, 1);
    super.onInit();
  }

  setProgressAnim(double maxWidth, int curPageIndex) {
    growStepWidth = maxWidth / totalPages;
    beginWidth = growStepWidth * (curPageIndex - 1);
    endWidth = growStepWidth * curPageIndex;

    progressAnimation = Tween<double>(begin: beginWidth, end: endWidth)
        .animate(progressAnimcontroller);

    progressAnimcontroller.forward();
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
