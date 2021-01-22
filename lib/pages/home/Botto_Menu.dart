



import 'package:flutter/material.dart';

class BottonMenuItem{
final String iconPath,label;

BottonMenuItem({@required this.iconPath,this.label});

}


class BottonMenu extends StatelessWidget {

  final List<BottonMenuItem> items;

  BottonMenu({@required this.items}):assert(items!=null && items.length > 0 );






  




  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blueGrey[50],
      padding: EdgeInsets.all(10),
      child: SafeArea(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:List.generate(items.length, (index) {
        final BottonMenuItem item =items[index];
        return  Column(

        

        mainAxisSize:MainAxisSize.min,
        
        children: <Widget>[
          
          Text(item.label)
        ]
        ,
        
        );
        }
        )
        )),
    );
  }
}