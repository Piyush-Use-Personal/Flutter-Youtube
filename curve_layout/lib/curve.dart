import 'package:flutter/material.dart';
class NiceCurve extends StatefulWidget {
  @override
  _NiceCurveState createState() => _NiceCurveState();
}

class _NiceCurveState extends State<NiceCurve> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
          child: Container(
            height: 300,
            color: Colors.red,
            width: double.infinity,
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height/2
        
        , size.width, size.height - 80);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
