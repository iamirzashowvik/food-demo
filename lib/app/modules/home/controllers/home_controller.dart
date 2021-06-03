import 'package:dio/dio.dart';
import 'package:food/app/modules/home/controllers/popularitems.dart';
import 'package:food/app/modules/home/controllers/setMenu.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'Categories.dart';
import 'banner.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController
  Dio dio = Dio();
  final count = 0.obs;
  final getCategoriesVar=[].obs;
  final getSetMenuVar=[].obs;
  var getCategoriesVarLength=0.obs;
  var getSetMenuLength=0.obs;
  @override
  void onInit() {
    getCategories();
    getSetMenu();
    getBanner();
    getPopularItems();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void getCategories() async{

    var response = await dio.get('https://dev.6amtech.com/efood/api/v1/categories');
    getCategoriesVar.add(categoriesFromJson(jsonEncode(response.data)));
    getCategoriesVarLength=getCategoriesVarLength+categoriesFromJson(jsonEncode(response.data)).length;
  }

  void getSetMenu()async {
    var response = await dio.get('https://dev.6amtech.com/efood/api/v1/products/set-menu');
    getSetMenuVar.add(setMenuFromJson(jsonEncode(response.data)));
    getSetMenuLength=getSetMenuLength+setMenuFromJson(jsonEncode(response.data)).length;
  }

  final getBannerVar=[].obs;
  var getBannerVarLength=0.obs;
  void getBanner() async{
    var response = await dio.get('https://dev.6amtech.com/efood/api/v1/banners');
    getBannerVar.add(bannerFromJson(jsonEncode(response.data)));
    getBannerVarLength=getBannerVarLength+bannerFromJson(jsonEncode(response.data)).length;
  }
  final getPopularItemsVar=[].obs;
  var getPopularItemsLength=0.obs;
  void getPopularItems() async{
    var response = await dio.get('https://dev.6amtech.com/efood/api/v1/products/latest?limit=10&&offset=1');
   getPopularItemsVar.add(popularItemsFromJson(jsonEncode(response.data)));
    getPopularItemsLength=getPopularItemsLength+popularItemsFromJson(jsonEncode(response.data)).products.length;
  }

}
