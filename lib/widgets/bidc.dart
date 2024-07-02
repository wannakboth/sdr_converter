import 'package:flutter/material.dart';

class BIDCTextLogo extends StatelessWidget {
  const BIDCTextLogo({
    super.key,
    required this.color,
    required this.fornSize,
    required this.isCenter,
  });

  final Color color;
  final double fornSize;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          "BID",
          style: TextStyle(
              fontSize: fornSize, fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          "C ",
          style: TextStyle(
              fontSize: fornSize,
              fontWeight: FontWeight.bold,
              color: Colors.red),
        ),
        Text(
          "Bank",
          style: TextStyle(
              fontSize: fornSize, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
