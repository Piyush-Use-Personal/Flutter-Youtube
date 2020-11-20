import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          FlipAnimation(
            backwardWidget: Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: Text('data')),
            forwardWidget: SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(backgroundImage: AssetImage('assets/nature.jpg')),
            ),
          ),
         FlipAnimation(
            backwardWidget: Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: Text('data')),
            forwardWidget: SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(backgroundImage: AssetImage('assets/nature.jpg')),
            ),
          ),
       ],
      ),
    ));
  }
}

class FlipAnimation extends StatefulWidget {
  final Widget forwardWidget;
  final Widget backwardWidget;

  FlipAnimation({this.forwardWidget, this.backwardWidget});

  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  bool isAnimationRunning = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    _controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.7, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.bounceInOut, reverseCurve: Curves.easeInOut)),
      child: GestureDetector(
          onTap: () {
            setState(() {
              if (isAnimationRunning) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
              isAnimationRunning = !isAnimationRunning;
            });
          },
          child: (isAnimationRunning)
              ? widget.forwardWidget
              : widget.backwardWidget),
    );
  }
}
