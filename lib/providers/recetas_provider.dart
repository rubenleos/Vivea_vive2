import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _RecetasProvider {
  List<dynamic> recetasPopulares = [];
  List<dynamic> categorias = [];

//queremos que carge la lista dinamica de la badd de json
  Future<List<dynamic>> cargarRecetasPopulares() async {
    //apuntamos hacia el json  para que lo almacene en resp ya esta el json cargado
    final resp = await rootBundle.loadString('lib/libs/bddjson/urljson.json');

//recivimos String y decodificamos el json
    Map<String, dynamic> recetasMap = json.decode(resp);
    recetasPopulares = recetasMap['recetasPopulares'];

    return recetasPopulares;
  }
   Future<List<dynamic>> cargarCategorias() async {
    //apuntamos hacia el json  para que lo almacene en resp ya esta el json cargado
    final resp = await rootBundle.loadString('lib/libs/bddjson/urljson.json');

//recivimos String y decodificamos el json
    Map<String, dynamic> recetasMapCat = json.decode(resp);
    categorias = recetasMapCat['categorias'];

    return categorias;
  }


}

final recetasProvider = _RecetasProvider();
