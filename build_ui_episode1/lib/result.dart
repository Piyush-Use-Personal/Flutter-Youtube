import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.low_priority, color: Colors.black),
          title: Column(
            children: [
              Icon(Icons.person_pin_circle, color: Colors.black),
              Text(
                'bandra',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/gym.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0.0, 0.01), // changes position of shadow
                    ),
                  ],
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Color.fromRGBO(22, 23, 35, 1),
                  ),
                  decoration: InputDecoration(
                    focusColor: null,
                    errorStyle: TextStyle(
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.search),
                    hintText: 'What do you want to play?',
                    hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      'choose '.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    child: Text(
                      'category '.toUpperCase(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: InkWell(onTap: () {}, child: Text('show all -->')),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemBox(),
                  ItemBox(),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      'Popular '.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Courts '.toUpperCase(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: InkWell(onTap: () {}, child: Text('show all -->')),
                  ),
                ],
              ),
            SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(const Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/run.jpeg'),
                              fit: BoxFit.cover),
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5.0)),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Rucker Bucker Street',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text(
                                  'Rucker Bucker Street',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          CustomAvatars(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              
                              children : [

                              Text('+37', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              Text('followers', style: TextStyle(fontSize: 10)),
                            ]),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ItemBox extends StatelessWidget {
  const ItemBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height/2,
      child: Stack(alignment: Alignment.bottomRight, children: <Widget>[
        Card(
            child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(const Radius.circular(5.0)),
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.red],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight)),
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            child: Text(
                              'Football',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 2),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            child: Text(
                              'hit by your leg!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text('72 Courts'),
                            ),
                          ),
                        ],
                      ))),
            )),
        Container(
          child: Image.asset(
            'assets/gym.png',
            height: 80,
          ),
        ),
      ]),
    );
  }
}

class CustomAvatars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
            Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child:
                    Image.asset('assets/gym.png'), // Provide your custom image
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child:
                    Image.asset('assets/gym.png'), // Provide your custom image
              ),
            ),
          ),
       

           Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child:
                    Image.asset('assets/gym.png'), // Provide your custom image
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultCards extends StatefulWidget {
  final String imageURL;
  final String id;
  final bool isReactangle;

  const ResultCards({this.imageURL, this.id, this.isReactangle = true});

  @override
  _ResultCardsState createState() => _ResultCardsState();
}

class _ResultCardsState extends State<ResultCards> {
  @override
  Widget build(BuildContext context) {
    double widthFactor = (!widget.isReactangle) ? 0.5 : 0.25;
    double heightFactor = (!widget.isReactangle) ? 0.25 : 0.4;
    double width = MediaQuery.of(context).size.width * widthFactor;
    double height = MediaQuery.of(context).size.height * heightFactor;
    return Card(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 10,
          //     blurRadius: 7,
          //     offset: Offset(0.0, 0.01), // changes position of shadow
          //   ),
          // ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
            image: NetworkImage(widget.imageURL),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(),
      ),
    );
  }
}
