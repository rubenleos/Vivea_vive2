import 'package:flutter/material.dart';

import 'detalles_comida.dart';

class DescPrin extends StatelessWidget {
  final String heroTag;
  final foodName;
  final foodPrice;
  var imageurl = [
    'https://tse4.mm.bing.net/th?id=OIP.pRWDM3mDtd8o8-fYWZ4pxQHaE8&pid=Api&P=0&w=251&h=169',
    'https://cdn.shortpixel.ai/client/to_webp,q_lossless,ret_img,w_1200/https://babyevolution.com.co/wp-content/uploads/2017/09/baby-evolution-blog-comida-saludable-5.jpg',
    'https://cdn.forbes.com.mx/2020/01/Pata-de-Elefante-640x360.jpg',
    'https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2018/04/recetas-sencillas-y-rapidas-con-pollo-y-verduras.jpg',
  ];
  //const DescPrin({Key key}) : super(key: key);
  DescPrin({Key key, this.heroTag, this.foodName, this.foodPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: EdgeInsets.only(top: 45.0),
        child: Container(
          height: MediaQuery.of(context).size.height - 300,
          child: ListView(children: [
            //converti en json
            _bFoodItem(context, imageurl[2], 'salmon platillo ', '\$FREE'),
            //_bFoodItem('assets/imagenes/salmon.jpg', 'salmon platillo ', '\$22.00'),
          ]),
        ),
      )
    ]));
  }

  Widget _bFoodItem(
      BuildContext context, String imPath, String foodName, String price) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10.0, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetallesComida(
                    heroTag: imPath,
                    foodName: foodName,
                    foodPrice: price,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Hero(
                      tag: imPath,
                      child: Image.network(
                        imPath,
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
                        foodName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
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
    );
  }
}
