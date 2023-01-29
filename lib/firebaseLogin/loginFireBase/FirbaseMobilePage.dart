import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../main.dart';
import 'FirebaseOTPVerifyPage.dart';

class FiremobilePage extends StatefulWidget {
  @override
  _FiremobilePageState createState() => _FiremobilePageState();
}

class _FiremobilePageState extends State<FiremobilePage> {
  TextEditingController mobileController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Mobile Number';
                      } else if (value.length < 10) {
                        return 'Please Enter Valid Mobile Number';
                      } else if (value.length > 10) {
                        return 'Please Enter Valid Mobile Number';
                      }
                      return null;
                    },
                    controller: mobileController,
                    decoration: const InputDecoration(
                      prefixText: '+91',
                      contentPadding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'Mobile',
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    buttonText: 'Send',
                    buttonClick: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(FirebaseOTPVerifyPage(
                          mobileNumber: mobileController.text,
                        ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
