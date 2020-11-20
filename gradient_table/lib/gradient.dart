import 'package:flutter/material.dart'
;
class CustomGradient {
  static BoxDecoration defaultGradient () {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
        Color.fromRGBO(63, 65, 104, 1),
        Color.fromRGBO(44, 46, 77, 1),
      ])
    );
  }
}