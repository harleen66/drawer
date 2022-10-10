// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:drawer/drawer.dart';
import 'package:drawer/models/catalog.dart';
import 'package:drawer/pages/itemwidget.dart';

import 'cartpage.dart';
import 'homewidget/catalogheader.dart';
import 'homewidget/cataloglist.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // const FirstPage({Key key}) : su//per(key: key);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    // print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
    //print(productData);
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(100, ((index) => CatalogModel.items[0]));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        child: Icon(CupertinoIcons.cart),
        backgroundColor: Colors.purpleAccent,
      ),
      backgroundColor: Color.fromARGB(255, 226, 226, 223),
      // appBar: AppBar(
      //   title: Text("catalog app"),
      //   backgroundColor: Colors.blueGrey,
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.all(9.0),
      //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //       ? ListView.builder(
      //           itemCount: CatalogModel.items.length,
      //           // itemCount: dummyList.length,
      //           itemBuilder: (context, index) {
      //             return ItemWidget(
      //               item: CatalogModel.items[index],
      //               // item: dummyList[index],
      //             );
      //           })
      //       : Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
