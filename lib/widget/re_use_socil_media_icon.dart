import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReUseSocialMediaIcon extends StatelessWidget {
  IconData iconData;
  Color color;
  ReUseSocialMediaIcon({required this.iconData,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
          style: BorderStyle.solid
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            spreadRadius: 2.0,
            color: Colors.grey.withOpacity(0.2),
          ),
        ]
      ),
      child: Center(
        child: Icon(iconData,size: 30,color: color)

      ),
    );
  }
}
