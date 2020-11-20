import 'package:flutter/material.dart';

class GlowContainer extends StatefulWidget {
  @override
  _GlowContainerState createState() => _GlowContainerState();
}

class _GlowContainerState extends State<GlowContainer>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
    ..addListener(() {setState(() {});});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 38, 38),
      body: Container(
        width: double.infinity,
        child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        'COINS',
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 27, 28, 30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(130, 237, 125, 58),
                            blurRadius: _animation.value,
                            spreadRadius: _animation.value,
                          ),BoxShadow(
                            color: Colors.red,
                            blurRadius: _animation.value/2,
                            spreadRadius: _animation.value/2,
                          )
                        ]),
                  ),
                  Spacer(),
                  ButtonTheme(
                    minWidth: 300,
                    child: RaisedButton(
                      onPressed: (){},
                      child: Text('Login'),
                      textColor: Colors.white,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width:1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.all(10),
                    )
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Text('New to COIN?', style: TextStyle(color: Colors.blue),),
                  ),
                  SizedBox(height: 15)
                ])),
      ),
    );
  }
}
