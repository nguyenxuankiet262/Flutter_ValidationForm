import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'My Hello World', home: ClickMeApp());
  }
}

class ClickMeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChangeText();
}

class ChangeText extends State<ClickMeApp> {
  final myController = TextEditingController();
  final myGlobalController = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  void _sayHello() {
    if (myGlobalController.currentState.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Hello " + myController.text),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('Flutter App')),
      body: Form(
        key: myGlobalController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your name!";
                }
              },
              controller: myController,
              decoration: InputDecoration(hintText: 'Enter your name'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: _sayHello,
                child: Text('Say Hi!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
