import 'package:flutter/material.dart';
import 'package:food/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class DefaulthomeController extends GetxController {
  //TODO: Implement DefaulthomeController
int currentIndex = 0;
  PageController pageController;
  final count = 0.obs;
  @override
  void onInit() {
    Get.put(HomeController());
    super.onInit();
    pageController = PageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }
  void increment() => count.value++;
}
