import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:vivea_dos/pages/home/Checklist.dart';
import 'package:vivea_dos/pages/home/Comida.dart';

import 'package:vivea_dos/pages/home/FoofPage.dart';
import 'package:vivea_dos/pages/home/Principal_Page.dart';
import 'package:vivea_dos/pages/home/gymPage.dart';
import 'package:vivea_dos/pages/controller/login_controller.dart';

class HomePage extends StatefulWidget {
  static final routeName = LoginController();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

//final PageProducts _listProducts =PageProducts;

  final PrincipalPage _homePage = PrincipalPage();
  final GymPage _gymPage = GymPage();
  final Comida _comida = Comida();

  Widget _showPage = new PrincipalPage();
//int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  Widget _pageselect(int page) {
    switch (page) {
      case 0:
        return _gymPage;
        break;

      case 1:
        return _homePage;
        break;

      case 2:
        return _comida;
        break;

      default:
        return new Container(
          child: new Center(child: new Text('NO se encontro la pagina')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        key: _bottomNavigationKey,
        items: <Widget>[
          SvgPicture.asset(
            'assets/login/icons/pesa.svg',
            width: 45,
          ),
          SvgPicture.asset(
            'assets/login/icons/casa.svg',
            width: 45,
          ),
          SvgPicture.asset(
            'assets/login/icons/bebida-de-coco.svg',
            width: 45,
          ),
        ],
        onTap: (int tappedIndex) {
          setState(
            () {
              _showPage = _pageselect(tappedIndex);
            },
          );
        },
      ),
      body: Container(
        color: Colors.redAccent,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
