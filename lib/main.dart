import 'package:drawer/pages/firstpage.dart';
import 'package:drawer/pages/homepage.dart';
import 'package:drawer/pages/theme.dart';
// import 'package:drawer/picture.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Drawer',
    home: FirstPage(),
    
    theme: ThemeData(primarySwatch: Colors.teal),

    // theme: MyTheme.lightTheme(context),
  ));
}
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.light,
//       debugShowCheckedModeBanner: false,
//       theme: MyTheme.lightTheme(context),
//     );
//   }
// }
