import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(2),
        children: <Widget>[
          // DrawerHeader(
          // child: Container(
          //   child: Text(
          //     "I am Drawer",
          //     style: TextStyle(color: Colors.white, fontSize: 18),
          //   ),
          //   decoration: BoxDecoration(color: Colors.teal),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text('xyzperson'),
            accountEmail: Text('xyz@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1498462440456-0dba182e775b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BsYXNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
            ),
          ),

          ListTile(
            // leading: Icon(CupertinoIcons.person),
            leading: Icon(Icons.person),
            title: Text("Account"),
            subtitle: Text("Person"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("abc@gamil.com"),
            trailing: Icon(Icons.send),
          ),
          //)
        ],
      ),
    );
  }
}
