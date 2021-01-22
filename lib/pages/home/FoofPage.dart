import 'package:flutter/material.dart';

import 'package:vivea_dos/pages/widgets/card_swiper_widget.dart';
import 'package:vivea_dos/providers/recetas_provider.dart';
//import 'package:vivea_dos/providers/pelicula_provider.dart';

class FoodPage extends StatelessWidget {
  //const FoodPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recetas1'),
          backgroundColor: Colors.blueAccent,
          actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
        ),
        body: ListView(children: [
          _swipperTarjetas(),
        ]));
  }

  Widget _swipperTarjetas() {
    return Container(
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//si tiene informacion
        },
      ),
    );
  }
}
