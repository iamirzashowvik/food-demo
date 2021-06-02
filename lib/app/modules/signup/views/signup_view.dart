import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignupView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.loginForm,
            child: Column(
              children: [
                TFFxM(controller.fName,'First Name'),
                TFFxM(controller.lName,'Last Name'),
                TFFxM(controller.phone,'Phone Number'),
                TFFxM(controller.email,'Email'),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.password,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password can not be empty';
                        }else if(value.length<6){
                          return 'The password must be at least 6 characters.';
                        }


                        return null;
                      },
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
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: controller.signUp, child: Text('Sign UP'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
