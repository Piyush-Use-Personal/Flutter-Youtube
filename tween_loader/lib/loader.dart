import 'package:flutter/material.dart';

class GhostLoader extends StatefulWidget {
  @override
  _GhostLoaderState createState() => _GhostLoaderState();
}

class _GhostLoaderState extends State<GhostLoader>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromRGBO(0, 90, 167, 1),
                Color.fromRGBO(255, 253, 228, 1)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: Tween(begin: 0.5, end: 1.0).animate(
                    CurvedAnimation(
                        curve: Curves.bounceInOut, parent: _controller),
                  ),
                  child: Container(
                      child:
                          Image.asset('assets/ghost.png', fit: BoxFit.contain)),
                ),
              ),
              SizedBox(height: 80),
              Container(
                width : MediaQuery.of(context).size.width * 0.5,
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor : Colors.white),
                  child: LinearProgressIndicator()))
            ],
          )),
    );
  }
}
