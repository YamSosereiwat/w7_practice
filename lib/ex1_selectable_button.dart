// EX 1 – The selectable button (handout page: EX 1). Start code from the handout.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: SelectedButton(),
        ),
      ),
    ));

class SelectedButton extends StatefulWidget {
  const SelectedButton({
    super.key,
  });

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {

  bool isSelected = false;

  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color? get backgroundColor => isSelected ? Colors.blue[500] : Colors.blue[50];

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
