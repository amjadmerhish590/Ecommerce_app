import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  OnPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;

  MyServices myServices = Get.find();

  late PageController pageController;

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(AppRoute.login);
      myServices.sharedPreferences.setString("step", "1");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  OnPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
