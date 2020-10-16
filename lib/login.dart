import 'package:flutter/material.dart';
import 'package:startFlutter/main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Builder(
            builder: (context) => Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/bg.jpg",
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.7),
                  colorBlendMode: BlendMode.darken,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Card(
                          child: Form(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter username",
                                      labelText: "Name"),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Enter password",
                                      labelText: "Password"),
                                ),
                                SizedBox(height: 20),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => MyApp()));
                                 //   Navigator.pushNamed(context, "/home");
                                  },
                                  child: Text('Login',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  color: Colors.blueAccent,
                                )
                              ],
                            ),
                          )),
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
