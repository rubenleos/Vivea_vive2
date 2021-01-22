

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart' show required
;
import 'dart:math' as mate; 




class Responsive{

final double width,height,inch;

  Responsive({
    @required this.width,
     @required this.height,
     @required this.inch});
    
     factory Responsive.of(BuildContext context){
       final  MediaQueryData data=MediaQuery.of(context);
       final size = data.size;
       final inch =mate.sqrt(mate.pow(size.width,2)+mate.pow(size.width,2));

      return Responsive(width: size.width,height: size.width,inch:inch);
      
     }

     double wp(double percent){
       return this.width * percent / 100 ;
     }

    double hp (double percent ){
     return this.width * percent / 100; 
     
     }

     double di (double percent ){
     return this.inch * percent / 100; 
     
     }


     


}
