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
                TFFxM(controller.fName,'First Name',TextInputType.name),
                TFFxM(controller.lName,'Last Name',TextInputType.name),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Phone can not be empty';
                        }else if(value.length!=11){
                          return 'The phone must be 11 characters.';
                        }


                        return null;
                      },
                      decoration: buildInputDecoration('Phone Number'),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.email,
                     validator: (value) {
                          RegExp regex = new RegExp(controller.emailPattern);
                          if (value.isEmpty) {
                            return 'Email can not be empty';
                          } else if (!regex.hasMatch(value)) {
                            return 'Enter Valid Email Format';
                          }

                          return null;
                        },
                      keyboardType: TextInputType.emailAddress,
                      decoration: buildInputDecoration('Email'),
                    ),
                  ),
                ),
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
                      decoration: buildInputDecoration('Password'),
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

  InputDecoration buildInputDecoration(String x) {
    return new InputDecoration(
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
                      hintText: x,
                    );
  }
}
