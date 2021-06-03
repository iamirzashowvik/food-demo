import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food/app/modules/defaulthome/controllers/defaulthome_controller.dart';
import 'package:food/app/modules/defaulthome/views/defaulthome_view.dart';
import 'package:food/app/modules/home/views/home_view.dart';
import 'package:food/app/routes/app_pages.dart';

import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  Dio dio = Dio();
Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Get.put(DefaulthomeController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void signUp() async{
    if (loginForm.currentState.validate()) {
try{

  var response =
      await dio.post("https://dev.6amtech.com/efood/api/v1/auth/register",
      data: {
        'f_name': fName.text,
        'l_name': lName.text,
        'phone': phone.text,
        'email': email.text,
        'password': password.text
      },
      options: Options(headers: {

      }));
  print(response.data);
  print(response.data['token']!=null);
if(
response.data['token']!=null

){print('1');

  Get.to(DefaulthomeView());
}else{
  print('2');
  Get.snackbar('Something Wrong', 'Check Internet Connection');
}
}
catch(e){

}

    }
    else{}
  }
  final loginForm = GlobalKey<FormState>();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
}

class TFFxM extends StatelessWidget {
  TFFxM(this._userName,this.imptyText,this.tit);

  final TextEditingController _userName;
  final String imptyText;
  final TextInputType tit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _userName,
          validator: (value) {
            if (value.isEmpty) {
              return '$imptyText can not be empty';
            }

            return null;
          },
          keyboardType: tit,
          decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.0),
                borderRadius:
                BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey[200],
                    width: 0.0),
                borderRadius:
                BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red[300],
                    width: 0.0),
                borderRadius:
                BorderRadius.circular(10)),
            focusedErrorBorder:
            OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red[300],
                    width: 0.0),
                borderRadius: BorderRadius
                    .circular(10)),
            filled: true,
            
            border: InputBorder.none,
            hintText: imptyText,
          ),
        ),
      ),
    );
  }
}