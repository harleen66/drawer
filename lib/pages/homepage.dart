import 'package:flutter/material.dart';

import '../changecard.dart';
import '../drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _caption = TextEditingController();
  var mytext = "Change Caption";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[200],
      
      appBar: AppBar(title: Text('Dummy App'),
      
      ),
      
      
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Card(
            child: ChangeCard(
                text: mytext, captionController: _caption),
          ),
        ),
      ),
      // body: Container(
      //   child: Text(
      //     "welcome",
      //     style: TextStyle(color: Colors.black26, fontSize: 44),
      //   ),
      //   alignment: Alignment.center,

      drawer: MyDrawer(),

      //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mytext = _caption.text;
          setState(() {});
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}