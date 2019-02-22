import 'package:elevator_pitch/item.dart';
import 'package:flutter/material.dart';
import 'models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elevator pitch',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Tópicos de la reunión'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String training = 'Capacitaciones';
  static const String secondaryTask = 'Tareas Secundarias';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ListView(
          children: _topics(data),
        ),
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () => _hi(context),
            tooltip: 'Increment',
            child: Icon(Icons.favorite_border),
          );
        },
      ),
    );
  }

  List<Widget> _topics(List data) {
    List list = <Widget>[];
    data.forEach((element) => list.add(_item(element)));
    return list;
  }

  Widget _item(dynamic item) {
    return Card(
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://www.webclass.com/site/wp-content/uploads/2018/09/icono_webclass.png'),
        ),
        title: Text(item['title']),
        children: _children(item),
      ),
    );
  }

  List<Widget> _children(dynamic item) {
    List children = <Widget>[];

    if (item['title'] == secondaryTask) {
      item['description'].forEach(
        (key, value) {
          children.add(
            ListTile(
              title: Text(key),
              subtitle: (value is String)
                  ? Text(value)
                  : Column(
                      children: List<Widget>.from(
                        value.map(
                          (element) => ListTile(
                                leading: Icon(Icons.edit),
                                title: Text(element),
                              ),
                        ),
                      ),
                    ),
            ),
          );
        },
      );
      return children;
    }

    for (var description in item['description']) {
      children.add(
        ListTile(
          contentPadding: EdgeInsets.only(left: 32),
          leading: Icon(
            item['title'] == training ? Icons.school : Icons.assignment,
          ),
          title: Text(description),
        ),
      );
    }

    return children;
  }

  void _hi(BuildContext context) {
    final SnackBar snackBar = SnackBar(content: Text('Buena !👋👋👋'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
