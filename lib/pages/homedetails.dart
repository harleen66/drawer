// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:drawer/pages/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key key,
    @required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${catalog.price}".text.bold.xl3.purple400.make(),
          AddtoCart(
            catalog: catalog,
          ).wh(120, 50)
          // ElevatedButton(
          //         onPressed: () {},
          //         style: ButtonStyle(
          //             backgroundColor: MaterialStateProperty.all(
          //                 Color.fromARGB(255, 221, 133, 236)),
          //             shape: MaterialStateProperty.all(StadiumBorder())),
          //         child: "Add to cart".text.make())
          //     .wh(120, 50)
        ],
      ).p16(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)),
          Expanded(
              child: VxArc(
            height: 30,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              width: context.screenWidth,
              color: Colors.grey[100],
              child: Column(
                children: [
                  catalog.name.text.xl4.bold.make().p1(),
                  catalog.desc.text.xl
                      .textStyle(context.captionStyle)
                      .bold
                      .make(),
                  20.heightBox,
                  " O dich heimat manchmal ihr die du ja, gesellschaft zu zürntest es schönen im der von vögel, du freunde glück."
                      .text
                      .xl
                      .textStyle(context.captionStyle)
                      .center
                      .make()
                ],
              ).py32(),
            ),
          ))
        ]),
      )),
    );
  }
}
