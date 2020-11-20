import 'package:flutter/material.dart';
import 'package:parallex_flutter/background.dart';
import 'package:parallex_flutter/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Landing(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var top = 0.0;
  final List<String> entries = <String>[
    'A', 'B', 'C',
    'A', 'B', 'C',
  ];
final List<int> colorCodes = <int>[
  600, 500, 100,
  600, 500, 100,
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification)
            setState(() => top -= v.scrollDelta / 2);
          return true;
        },
        child: ListView(
            children: [
              Stack(
                children: <Widget>[
        //The background
        Positioned(
          top: top,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 300.0),
            child: Image.asset('assets/nature.jpg'),
          ),
        ),
        //The scroll view
                 ],
              ),
            ListView.separated(
  padding: const EdgeInsets.all(8),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 50,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
)
            ],
          ),
      ),
    );
  }
}
