import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController {
  //instanceamos el firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool succes;
  String userEmail;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      succes = true;

      print('registro ok ');
      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed('principalPage');
      });
      userEmail = user.email;
    } else {
      succes = false;
    }
  }
}
