import 'package:flutter/material.dart';

class DashTextField extends StatefulWidget {
  const DashTextField({super.key});

  @override
  State<DashTextField> createState() => DashTextFieldState();
}

class DashTextFieldState extends State<DashTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      print("Text field lost focus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        focusNode: _focusNode,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter a search term',
        ),
      ),
    );
  }
}
