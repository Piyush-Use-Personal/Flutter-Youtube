import 'package:flutter/material.dart';
import 'package:gradient_table/customButton.dart';
import 'package:gradient_table/dataTable.dart';

class LogisticStat extends StatefulWidget {
  @override
  _LogisticStatState createState() => _LogisticStatState();
}

class _LogisticStatState extends State<LogisticStat> {

  List<String> table1Col = ['name', 'unit', 'price'];
  List<List<String>> table1Rows = [
    ['lorem', '20', '24rs'],
    ['lorem', '20', '24rs'],
    ['lorem', '20', '24rs'],
    ['lorem', '20', '24rs'],
    ['lorem', '20', '24rs'],
  ];  
  List<String> table2Col = ['COD', 'price'];
  List<List<String>> table2Rows = [
    ['Submitted', 'rs400'],
    ['Submitted', 'rs400'],
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Stats'),
      ),
      body: Container(
        child: Column(children: [
          Container(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your last 7 days record',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ))
          ,ScrollDataTable(
            header: table1Col,
            content: table1Rows,
          ),
          SizedBox(height: 30,),
          ScrollDataTable(
            header: table2Col,
            content: table2Rows,),
          Spacer(),
          CustomButton(name: 'Continue', onPressed : (){})

       
        ]),
      ),
    );
  }
}
