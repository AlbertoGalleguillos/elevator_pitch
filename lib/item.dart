import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final Map item;

  const Item({Key key, this.item}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(widget.item['title']),
      ),
      body: Container(
        child: Center(
          child: Text(widget.item['description'].toString() ?? 'Hola !'),
        ),
      ),
    );
  }
}
