import 'package:dashing_around/pincode_field.dart';
import 'package:dashing_around/textfield.dart';
import 'package:flutter/material.dart';

import 'dropdown_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String title = "Dashing Around";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DashAppBar(title: title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DashTextField(
                lostFocusAction: () {
                  print("Text field lost focus");
                  return Future.value();
                },
                labelText: "Label",
                hintText: "Enter text here",
                backgroundColor: Colors.transparent,
                isFilled: true,
                textColor: Colors.black,
                borderRadius: 8.0,
                borderColor: Colors.blueAccent,
                errorBorderColor: Colors.red,
              ),
              DashPinCodeField(),
              DashDropDownSearch(
                onSelected: (() {
                  print("Dropdown selected");
                }),
                response: "null",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashAppBar extends StatelessWidget {
  const DashAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            "assets/images/dash.png",
            width: 40,
          ),
        ),
        Text(title),
      ],
    );
  }
}
