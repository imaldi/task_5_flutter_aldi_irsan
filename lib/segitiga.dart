import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class HomePageSegitiga extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Segitiga",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SegitigaSamaSisiPage(title: "Halaman Luas dan Keliling Segitiga"),
    );
  }
}

class SegitigaSamaSisiPage extends StatefulWidget{

  final String title;
  SegitigaSamaSisiPage({Key key, this.title}) : super(key: key);

  @override
  _SegitigaSamaSisiPageState createState() => _SegitigaSamaSisiPageState();

}

class _SegitigaSamaSisiPageState extends State<SegitigaSamaSisiPage> {

  final panjangAlasSegitigaController = TextEditingController();
  final tinggiSegitigaController = TextEditingController();
  String hasil = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    panjangAlasSegitigaController.dispose();
    tinggiSegitigaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bujur Sangkar Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Center( child:  Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child:
                    Column(children: [
                      TextFormField(
                        controller: panjangAlasSegitigaController,
                        validator: (String value){
                          if(value.isEmpty){
                            return "Silahkan Isi Panjang Alas Segitiga yang mau dihitung";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Alas Segitiga",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                      ),
                      TextFormField(
                        controller: tinggiSegitigaController,
                        validator: (String value){
                          if(value.isEmpty){
                            return "Silahkan Isi tinggi Segitiga yang mau dihitung";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Panjang Sisi",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                        ),
                      ),
                    ],)
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(
                    child: Text("Luas"),
                    onPressed: (){
                      if(_formKey.currentState.validate()) {
                        setState(() => hasil = "Luasnya adalah : "
                            +(int.parse(panjangAlasSegitigaController.text)*int.parse(tinggiSegitigaController.text)*0.5).toString());
                      }
                    },),
                  SizedBox(height: 10,),
                  RaisedButton(
                    child: Text("Keliling"),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        setState(() => hasil = "Kelilingnya adalah : "
                            +(3*int.parse(panjangAlasSegitigaController.text)).toString());
                      }
                    },),
                  SizedBox(height: 10,),
                  Text(""+hasil)
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }}