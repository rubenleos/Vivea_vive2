import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RedondoBotton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const RedondoBotton({Key key, this.onPressed, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {  },
      child: Container(child: Text(this.label,style: TextStyle(color:Colors.white,letterSpacing: 1 ,fontSize: 20,),),
      padding: EdgeInsets.symmetric(horizontal:40,vertical:15),
      decoration: BoxDecoration(color:Colors.cyan,boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5),],
      borderRadius: BorderRadius.circular(30)
      ),
      )
    );
  }
}