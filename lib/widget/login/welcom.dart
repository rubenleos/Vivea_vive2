


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vivea_dos/utilies/resposive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {



    final Responsive responsive = Responsive.of(context);
    
    
    return AspectRatio(
      


         aspectRatio: 16/11 ,
          child:LayoutBuilder(
            builder: (_,constraints){
              return Container(
               // color: Colors.red,
                child: (Stack(
                  children: <Widget>[
                  Positioned(
                    top: constraints.maxHeight*0.55,
                    child: Container(
                    height:3,
                    width: constraints.maxWidth,
                    color: Colors.white10,
                    ),
                    
                  ),
                  Text('Hola',
                  style: TextStyle(
                    fontSize : responsive.di(2),
                    fontWeight: FontWeight.bold,
                  ),),
                  Center(
                    child: Positioned(child:SvgPicture.asset('assets/login/gimnasio.svg',
                    width: constraints.maxWidth*0.36,)),
                  )
                ],
                )
                ),
              );
            }),
    );
  }
}