import 'package:flutter/material.dart';
import 'package:vivea_dos/pages/widgets/card_swipper_categorias.dart';
import 'package:vivea_dos/pages/widgets/detalles_comida.dart';

List<Widget> recetasListadoFuture(
    BuildContext context, List<dynamic> recetasPopulares) {
  //creamos la lista de datos a retornar

  final List<Widget> listadoDeRecetas = [];

  recetasPopulares.forEach((recetas) {
    final listadoWidget = _bFoodItems(context, recetas);
    listadoDeRecetas.add(listadoWidget);
  });
  return listadoDeRecetas;
}

Widget _bFoodItems(BuildContext context, Map<String, dynamic> receta) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10.0, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetallesComida(
                      heroTag: receta['foto'],
                      foodName: receta['titulo'],
                      foodPrice: receta['calorias'],
                    )));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Hero(
                        tag: receta['foto'],
                        child: Image.network(
                          receta['foto'],
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0,
                        )),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receta['titulo'],
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          receta['calorias'],
                          style: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontSize: 17.0,
                              color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add), color: Colors.black, onPressed: null)
            ],
          ),
        ),
      ),
    ],
  );
}
