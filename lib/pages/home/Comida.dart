import 'package:flutter/material.dart';
import 'package:vivea_dos/builders/recetas_listado.dart';
import 'package:vivea_dos/pages/widgets/card_swiper_widget.dart';
import 'package:vivea_dos/pages/widgets/card_swipper_categorias.dart';
import 'package:vivea_dos/pages/widgets/detalles_comida.dart';

//import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:vivea_dos/providers/recetas_provider.dart';

class Comida extends StatefulWidget {
  Comida({Key key}) : super(key: key);

  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
  String url =
      "https://crujienteyaldente.com/wp-content/uploads/2017/03/Acelgas-salteadas-con-ajo.jpg";
  //File _file ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21BDFBD),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              left: 10.0,
            ),
            child: Row(children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {},
              ),
              Container(
                width: 125.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {}),
                  ],
                ),
              ),
            ]),
          ),

          // SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Healthy',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
              ],
            ),
          ),
//////
          _swipperTarjetas(),

          SizedBox(
            height: 50.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.0,
                    left: 100.0,
                  ),
                  //categorias
                  child: Text('Categorias',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black12,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ),
                _swipperTarjetasCategorias(),

                //categorias cierre

                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 45.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 300,
                        child: ListView(children: [
                          //converti en json min 8:46
                          FutureBuilder(
                              future: recetasProvider.cargarRecetasPopulares(),
                              initialData: [],
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<dynamic>> snapshot) {
                                return Column(
                                  children: recetasListadoFuture(
                                      context, snapshot.data),
                                );
                              }),
                          //_bFoodItem('assets/imagenes/salmon.jpg', 'salmon platillo ', '\$22.00'),
                        ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]));
  }

  Widget _swipperTarjetas() {
    return Container(
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//si tiene informacion
          return CardsSwipper();
        },
      ),
    );
  }

  Widget _swipperTarjetasCategorias() {
    return Container(
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//si tiene informacion
          return CardsSwipperCatego();
        },
      ),
    );
  }
}
