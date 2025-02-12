import 'package:flutter/material.dart';
import 'package:task_6_flutter_aldi_irsan/bujur_sangkar.dart';
import 'package:task_6_flutter_aldi_irsan/segitiga.dart';
import 'package:task_6_flutter_aldi_irsan/persegi_panjang.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Bujur Sangkar"),
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BujurSangkarPage())
                );
              },
            ),
            RaisedButton(
              child: Text("Segitiga"),
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SegitigaSamaSisiPage())
                );
              },
            ),
            RaisedButton(
              child: Text("Persegi Panjang"),
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PersegiPanjangPage())
                );
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}