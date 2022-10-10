import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/image/login.jpg",
      fit: BoxFit.cover,
    );
  }
}
