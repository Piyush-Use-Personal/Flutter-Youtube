import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Get the best services on the application',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
            height: 400,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/nature.jpg'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: TabSwitcher(
                    forwardWidget: Container(
                      height: 80,
                      width: 100,
                      key: ValueKey<int>(0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Humidity'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '49%',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                    backwardWidget: Container(
                      height: 80,
                      width: 100,
                      key: ValueKey<int>(1),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Cloudly'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              '220k',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 250,
                  child: TabSwitcher(
                    forwardWidget: Container(
                      key: ValueKey<int>(0),
                      child: Center(
                        child: Icon(Icons.track_changes, color: Colors.white),
                      ),
                      height: 80,
                      width:100,
                      decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle
                      ),
                    ),
                    backwardWidget:  Container(
                      key: ValueKey<int>(1),
                      child: Center(
                        child: Icon(Icons.question_answer,),
                      ),
                      height: 80,
                      width:100,
                      decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle
                      ),
                    ),
                  ),
                )
             ,Positioned(
                  right: 50,
                  top: 250,
                  child: TabSwitcher(
                    backwardWidget: Container(
                      key: ValueKey<int>(0),
                      child: Center(
                        child: Icon(Icons.queue_play_next, color: Colors.white),
                      ),
                      height: 80,
                      width:100,
                      decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle
                      ),
                    ),
                    forwardWidget:  Container(
                      key: ValueKey<int>(1),
                      child: Center(
                        child: Icon(Icons.share,),
                      ),
                      height: 80,
                      width:100,
                      decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle
                      ),
                    ),
                  ),
                )
             
              ],
            ),
          ),
          Spacer(),
          ButtonTheme(
            minWidth: 300,
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18))),
          )
        ],
      ),
    ));
  }
}

class TabSwitcher extends StatefulWidget {
  final Widget forwardWidget;
  final Widget backwardWidget;

  TabSwitcher({this.forwardWidget, this.backwardWidget});

  @override
  _TabSwitcherState createState() => _TabSwitcherState();
}

class _TabSwitcherState extends State<TabSwitcher> {
  bool isForward = true; // by default forward should be visible
  Widget currentWidget;
  @override
  Widget build(BuildContext context) {
    currentWidget = (isForward) ? widget.forwardWidget : widget.backwardWidget;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isForward) {
            isForward = false;
            currentWidget = widget.backwardWidget;
          } else {
            isForward = true;
            currentWidget = widget.forwardWidget;
          }
        });
      },
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 550),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(
                scale: animation,
                child:
                    child), // this will change the default transition to scale
        child: currentWidget,
      ),
    );
  }
}
