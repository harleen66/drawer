
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl4
            .bold
            .color(Color.fromARGB(135, 217, 124, 198))
            .make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}
