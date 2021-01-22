import 'package:flutter/material.dart';

import 'package:vivea_dos/pages/routes/misRutas.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: 'vivea',
      debugShowCheckedModeBanner: false,
      initialRoute: '/PrincipalPage',
      navigatorKey: Get.key,
      getPages: routes(),
    ),
  );
}
//borrar
