import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:vivea_dos/pages/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController()); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: const Text(
                        "LoginPage vitae ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (String value) {
                        if (value.isEmpty) return ' ingrese algun texto';
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(labelText: 'passwors'),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (String value) {
                        if (value.isEmpty) return ' pleas enter some text';
                        return null;
                      },
                      obscureText: true,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: SignInButton(
                        Buttons.Email,
                        text: "Sign IN",
                        onPressed: () async {
                          _.signInWithEmailAndPassword();
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: SignInButton(
                        Buttons.Email,
                        text: 'registrarse',
                        onPressed: () async {},
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: SignInButton(
                        Buttons.FacebookNew,
                        text: 'Ingrese Con Facebook ',
                        onPressed: () async {
                          _.facebook();
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: SignInButton(
                        Buttons.GoogleDark,
                        text: 'Google',
                        onPressed: () async {
                          _.signInWithGoogle();
                        },
                      ),
                    )
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
