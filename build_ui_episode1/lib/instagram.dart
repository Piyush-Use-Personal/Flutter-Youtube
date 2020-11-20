import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Instagram extends StatelessWidget {
  final Map<String, dynamic> data = {
    'name': 'SpeedCodez',
    'profilePicture': 'assets/travel.jpg', //you should use network images
    'postPicture': 'assets/run.jpeg',
    'likesCount': 101,
    'caption': 'Do Like and Subscribe',
    'location': 'Makers Street, LA'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
          centerTitle: true,
          actions: [
            Icon(Icons.send),
            SizedBox(
              width: 10,
            )
          ],
          leading: Icon(Icons.camera_alt),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(data['profilePicture']),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['location'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  child: Icon(Icons.more_horiz),
                )
              ],
            ),
            Container(
              width: double.infinity,
              child: Image.asset(data['postPicture'], fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.comment),
                      SizedBox(width: 10,),
                      Icon(FontAwesomeIcons.paperPlane),
                    ],
                  ),
                      Icon(FontAwesomeIcons.bookmark),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                            child: Container(
                  child: Text(data['likesCount'].toString() + ' likes')
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    child: Text(data['name'], style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(width: 5),
                   Container(
                    child: Text(data['caption'],),
                  ),
                ],
              ),
            )
        
        
        
        
        
        
        
          ]),
        )));
  }
}
