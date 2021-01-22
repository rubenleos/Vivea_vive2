import 'package:vivea_dos/pages/home/FoofPage.dart';

import 'package:vivea_dos/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:vivea_dos/pages/widgets/descPrin.dart';
import 'package:vivea_dos/pages/widgets/detalles_comida.dart';
import 'package:vivea_dos/widget/login/login_page.dart';

routes() => [
      GetPage(name: "/homme", page: () => HomePage()),
      // GetPage(name: '/registration', page: =>RegisterPage())
      GetPage(
          name: "/foodPage",
          page: () => FoodPage(),
          transition: Transition.zoom),
      GetPage(
          name: "/LoginPage",
          page: () => LoginPage(),
          transition: Transition.zoom),

      GetPage(
          name: "/PrincipalPage",
          page: () => HomePage(),
          transition: Transition.zoom),
      GetPage(
          name: "/detalles",
          page: () => DetallesComida(),
          transition: Transition.zoom),

      GetPage(
          name: "/Descripsionprin",
          page: () => DescPrin(),
          transition: Transition.zoom)
    ];
