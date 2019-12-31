import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:simple_form/base_consumer.dart';
import 'package:simple_form/model/person.dart';
import 'package:simple_form/pages/secondPage.dart';

class FirstPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<Person>(
      model: Person(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Calculate your Ideal Weight'),
        ),
        body: BodyWidget(fbKey: _fbKey),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => onPressed(context, model),
          tooltip: 'Go to the next page',
          label: Text('Next Page'),
          icon: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  void onPressed(context, model) {
    if (_fbKey.currentState.saveAndValidate()) {
      model.name = _fbKey.currentState.value['name'];
      model.age = int.parse(_fbKey.currentState.value['age']);
      model.height = _fbKey.currentState.value['slider'];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(),
        ),
      );
    }
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
    @required GlobalKey<FormBuilderState> fbKey,
  })  : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          FormBuilder(
            key: _fbKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: "name",
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "What is your name?",
                    ),
                    style: TextStyle(fontSize: 25.0),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.max(70),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderTextField(
                    attribute: "age",
                    decoration: InputDecoration(
                      labelText: "Age",
                      hintText: "How old are you?",
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 25.0),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(100),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FormBuilderSlider(
                    attribute: "slider",
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.min(50)
                    ],
                    min: 0.0,
                    max: 300.0,
                    initialValue: 10.0,
                    decoration: InputDecoration(
                      labelText: "Height in cm",
                      labelStyle: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
