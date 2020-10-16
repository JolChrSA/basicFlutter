import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:startFlutter/navReturnData.dart';
import 'package:startFlutter/navigation.dart';
import 'package:startFlutter/navigationWithInfo.dart';
import 'package:startFlutter/sendDataNav.dart';
//import 'package:startFlutter/grid.dart';
//import 'package:startFlutter/rows.dart';
//import 'package:startFlutter/stateFull.dart';
import 'dart:convert';
import 'login.dart';

void main() => runApp(SendDataNav());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  var myText = "My Text";
  var url = "https://jsonplaceholder.typicode.com/photos/";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: data != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(data[index]["title"]),
                      subtitle: Text("Id: ${data[index]["id"]}"),
                      leading: Image.network(data[index]["thumbnailUrl"]),
                    ),
                  );
                },
                itemCount: data.length)
            : Center(child: CircularProgressIndicator()),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text('Joliph Christian'),
                  accountEmail: Text('joliph.christian.sa@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"))),
              // DrawerHeader(
              //   child: Text('Hello Flutter'),
              //   decoration: BoxDecoration(color: Colors.purple),
              // ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Joliph Christian'),
                subtitle: Text('joliph.christian.sa@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('joliph.christian.sa@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Joliph Christian'),
                subtitle: Text('joliph.christian.sa@gmail.com'),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              myText = nameController.text;
              setState(() {});
            },
            child: Icon(Icons.refresh)),
      ),
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => MyApp()
      },
    );
  }
}

class FloatingActionBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  TextEditingController nameController = TextEditingController();
  var myText = "My Text";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Card(
          child: ChangeNameCard(myText: myText, nameController: nameController),
        ),
      ),
    );
  }
}

class ChangeNameCard extends StatelessWidget {
  const ChangeNameCard({
    Key key,
    @required this.myText,
    @required this.nameController,
  }) : super(key: key);

  final String myText;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/bg.jpg", fit: BoxFit.cover),
        SizedBox(height: 20),
        Text(myText, style: TextStyle(fontSize: 25)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter something here",
                labelText: "Name"),
          ),
        )
      ],
    );
  }
}

class RowColumWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.lightBlue,
        ),
        width: 150, //MediaQuery.of(context).size.width,
        height: 400, //MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //color: Colors.blueAccent,
        padding: EdgeInsets.all(8),
        width: 200,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5, offset: Offset(2.0, 5.0))
            ],
            gradient:
                LinearGradient(colors: [Colors.blueAccent, Colors.tealAccent])),
        child: Text(
          'Hello, world',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
