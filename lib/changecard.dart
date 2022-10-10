import 'package:drawer/drawer.dart';
import 'package:drawer/pages/homepage.dart';
import 'package:flutter/material.dart';

import 'picture.dart';

class ChangeCard extends StatefulWidget {
  ChangeCard({
    Key key,
    @required this.text,
    @required TextEditingController captionController,
    // @required changeButton,
  })  : _captionController = captionController,
        super(key: key);

  final String text;
  final TextEditingController _captionController;
  bool changeButton = false;

  @override
  State<ChangeCard> createState() => _ChangeCardState();
}

class _ChangeCardState extends State<ChangeCard> {
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 2));

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Picture()),
      );
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Picture(),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 20, color: Colors.teal),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              validator: ((value) {
                if (value.isEmpty) {
                  return "enter caption ";
                }
                return null;
              }),
              controller: widget._captionController,
              //keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Caption Here',
                  labelText: 'Caption'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
              child: InkWell(
                //splashColor: Colors.red,
                onTap: () => moveToHome(context),
                // async {
                //   setState(() {
                //     changeButton = true;
                //   });
                //   await Future.delayed(Duration(seconds: 2));

                //   await Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Picture()),
                //   );
                //   setState(() {
                //     changeButton = false;
                //   });
                // },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: changeButton ? 70 : 120,
                  alignment: Alignment.center,
                  child: changeButton
                      ? Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : Text(
                          "Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                          //       ),
                          // decoration: BoxDecoration(
                          //     color: Colors.teal,
                          //     // shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          //     borderRadius: BorderRadius.circular(changeButton ? 50 : 8)),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
