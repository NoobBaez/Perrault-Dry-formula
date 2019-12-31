import 'package:flutter/cupertino.dart';

class Person extends ChangeNotifier {
  String name;
  int age;
  double height;

  Person({this.name, this.age, this.height});

  /* The Perrault Dry formula. It is not too well known, 
  but it is quite reliable since factors such as age are included. */
  double perrault() {
    var idealWeight = this.height - 100 + ((this.height / 10) * 0.9);
    return idealWeight;
  }
}
