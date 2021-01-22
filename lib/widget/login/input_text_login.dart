import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputText extends StatelessWidget {
  final String iconpath, placeholder;
  const InputText(
      {Key key, @required this.iconpath, @required this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
      prefix: Container(
          width: 40,
          height: 30,
          child: SvgPicture.asset(this.iconpath, color: Colors.grey[300])),
      placeholder: this.placeholder,
      placeholderStyle: TextStyle(fontFamily: 'sans', color: Colors.blueGrey),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.blueGrey[50]))),
    );
  }
}
