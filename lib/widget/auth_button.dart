
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const AuthButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width-30,
        height: MediaQuery.of(context).size.height * 0.078,

        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}