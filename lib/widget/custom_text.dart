
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
        required this.discription,
        required this.text,
        required this.onTap})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
              text: discription,
              style: const TextStyle(color: Colors.black87, fontSize: 16),
              children: [
                TextSpan(
                    text: text,
                    style: const TextStyle(color: Colors.green, fontSize: 16,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()..onTap = onTap),
              ]),
        ),
      ],
    );
  }
}