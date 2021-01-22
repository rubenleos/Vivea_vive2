import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vivea_dos/pages/controller/register_lgin_controller.dart';

class RegisterLoginPage extends StatelessWidget {
  final controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<LoginRegisterController>(builder: (_) {
      return Form(
        child: Card(
          //Edge insets all es un pading para todos los lados
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(labelText: 'email'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'ingrese algun texto ';
                      }
                      return null;
                    }),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: const InputDecoration(labelText: 'password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'ingrese algun texto ';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    child: Text('Register'),
                    onPressed: () {
                      _.register();
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(controller.succes == null
                      ? ""
                      : (controller.succes
                          ? 'succes registred ' + controller.userEmail
                          : 'Registro fallo ')),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
