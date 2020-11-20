import 'package:flutter/material.dart';

void main() => runApp(NeumorphicApp());

class NeumorphicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blueGrey.shade200,
        scaffoldBackgroundColor: Colors.blueGrey.shade200,
        dialogBackgroundColor: Colors.blueGrey.shade200,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade200,
        title: Text(
          'Shadow-Alex',
          style: TextStyle(color: Colors.blueGrey, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NeumorphicContainer(
                  child: Icon(Icons.favorite),
                ),
                NeumorphicContainer(
                  color: Colors.black,
                  child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/image1.jpg"),
                              fit: BoxFit.fill))),
                ),
                NeumorphicContainer(
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text('Low Life', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          Text('Touch the Fire', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
          SizedBox(height: 20,),
          Slider(
            value: 50,
            onChanged: (rate){},
            min: 0,
            max: 100,
            activeColor: Colors.black, inactiveColor: Colors.grey,
          ),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NeumorphicContainer(child: Icon(Icons.fast_rewind)),
                NeumorphicContainer(child: Icon(Icons.play_arrow), color: Colors.yellow[700],),
                NeumorphicContainer(child: Icon(Icons.fast_forward)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color ?? Theme.of(context).backgroundColor;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                      blurRadius: widget.bevel,
                      offset: -widget.blurOffset,
                      color: color.mix(Colors.white, 0.6)),
                  BoxShadow(
                      blurRadius: widget.bevel,
                      offset: widget.blurOffset,
                      color: color.mix(Colors.white, 0.3))
                ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _isPressed ? color : color.mix(Colors.black, 0.1),
              _isPressed ? color.mix(Colors.black, 0.05) : color,
              _isPressed ? color.mix(Colors.black, 0.05) : color,
              color.mix(Colors.white, _isPressed ? 0.2 : 0.5)
            ],
            stops: [0.0, 0.3, 0.6, 1.0],
          ),
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
