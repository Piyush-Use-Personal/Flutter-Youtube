import 'package:flutter/material.dart';
import 'package:gradient_table/gradient.dart';

class ScrollDataTable extends StatelessWidget {
  final List<String> header;
  final List<List<String>> content;

   ScrollDataTable({this.header, this.content});
  
    final TextStyle txtsty = new TextStyle(
      fontWeight: FontWeight.w300, fontSize: 14
    );
  List<TableRow> _getTableContent(
      List<String> header, List<List<String>> content) {
    return _mergeTable(_getHeaderRow(header), _getContentRow(content));
  }

  List<TableRow> _getContentRow(List<List<String>> content) {
    return List<TableRow>.generate(
      content.length,
      (index) => TableRow(
        children: List<Widget>.generate(
          content[index].length,
          (i) => makeRowItem(content[index][i], i),
        ),
      ),
    );
  }

  _getHeaderRow(List<String> header) {
    return TableRow(
      decoration: CustomGradient.defaultGradient(),
      children: List<Widget>.generate(
        header.length,
        (index) => makeRowItem(header[index], index),
      ),
    );
  }

  makeRowItem(String name, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(name,
            style : txtsty)
      ),
    );
  }

  List<TableRow> _mergeTable(header, List<TableRow> content) {
    List<TableRow> newList = content;
    newList.insert(0, header);
    return newList;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder(
          horizontalInside:
              BorderSide(width: 1, color: Color.fromRGBO(63, 65, 104, 1)),
        ),
        children: _getTableContent(header, content),
      ),
    );
  }
}
