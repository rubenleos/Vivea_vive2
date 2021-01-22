import 'package:flutter/material.dart';

//import 'package:vivea_dos/libs/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

//import 'package:cached_network_image/cached_network_image.dart';

class CardsSwipper extends StatelessWidget {
  var imageurl = [
    'https://tse4.mm.bing.net/th?id=OIP.pRWDM3mDtd8o8-fYWZ4pxQHaE8&pid=Api&P=0&w=251&h=169',
    'https://cdn.shortpixel.ai/client/to_webp,q_lossless,ret_img,w_1200/https://babyevolution.com.co/wp-content/uploads/2017/09/baby-evolution-blog-comida-saludable-5.jpg',
    'https://cdn.forbes.com.mx/2020/01/Pata-de-Elefante-640x360.jpg',
    'https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2018/04/recetas-sencillas-y-rapidas-con-pollo-y-verduras.jpg',
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    //ver para obtener image firebae
    return Container(
      padding: EdgeInsets.only(top: 28),
      width: double.infinity,
      height: 200,
      child: Swiper(
          itemCount: imageurl.length,
          itemWidth: 300.0,
          itemHeight: 200.0,
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: CachedNetworkImage(
                imageUrl: imageurl[index],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          },
          pagination: new SwiperPagination()),
    );
  }
}
