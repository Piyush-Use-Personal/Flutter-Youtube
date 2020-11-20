import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CustomButton({this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        padding: const EdgeInsets.all(16.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius : BorderRadius.circular(5),
          side : BorderSide(color: Colors.red)
        ),
        color: Colors.red,
        child: Container(
          width: double.infinity,

          child: Text(name.toUpperCase(),
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
