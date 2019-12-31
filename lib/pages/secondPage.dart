import 'package:flutter/material.dart';
import 'package:simple_form/base_consumer.dart';
import 'package:simple_form/model/person.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideal Weight'),
      ),
      body: BaseWidget<Person>(
        model: Person(),
        builder: (context, model, child) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${model.name} ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'is '),
                    TextSpan(
                        text: '${model.age} ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'years old, '),
                    TextSpan(
                        text: '${model.height.toStringAsFixed(1)} ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'centimeters tall, and his ideal weight is: '),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      '${model.perrault().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Pounds'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
