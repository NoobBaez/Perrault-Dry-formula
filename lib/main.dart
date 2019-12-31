//Flutter and Dart import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_form/pages/firstPage.dart';

import 'model/person.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Person(),
      child: MaterialApp(
        title: 'Simple Form',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FirstPage();
  }
}
