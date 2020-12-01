import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bujur sangkar",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BujurSangkarPage(title: "Halaman Luas dan Keliling Bujur Sangkar"),
    );
  }
}

class BujurSangkarPage extends StatefulWidget{

  final String title;
  BujurSangkarPage({Key key, this.title}) : super(key: key);

  @override
  _BujurSangkarPageState createState() => _BujurSangkarPageState();

}

class _BujurSangkarPageState extends State<BujurSangkarPage> {

  final panjangSisiController = TextEditingController();
  String hasil = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    panjangSisiController.dispose();
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
                    TextFormField(
                      controller: panjangSisiController,
                      validator: (String value){
                        if(value.isEmpty){
                          return "Silahkan Isi Panjang Sisi Bujur Sangkar yang mau dihitung";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Panjang Sisi",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                      ),
                    ),
                ),
                    SizedBox(height: 10,),
                    RaisedButton(
                      child: Text("Luas"),
                      onPressed: (){
                        if(_formKey.currentState.validate()) {
                          // hasil = "Luas Sekian";
                          setState(() => hasil = "Luasnya adalah : "
                              +(int.parse(panjangSisiController.text)*int.parse(panjangSisiController.text)).toString());
                          // Fluttertoast.showToast(
                          //     msg: ""+(int.parse(panjangSisiController.text)*int.parse(panjangSisiController.text)).toString(),
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIos: 1,
                          //     backgroundColor: Colors.green,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0
                          // );
                        }
                              // (int.parse(panjangSisiController.text)*int.parse(panjangSisiController.text)).toString();
                    },),
                    SizedBox(height: 10,),
                    RaisedButton(
                      child: Text("Keliling"),
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          // hasil = "Keliling Sekian";
                          setState(() => hasil = "Kelilingnya adalah : "
                              +(4*int.parse(panjangSisiController.text)).toString());
                          // Fluttertoast.showToast(
                          //     msg: ""+(4*int.parse(panjangSisiController.text)).toString(),
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIos: 1,
                          //     backgroundColor: Colors.green,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0
                          // );
                        }
                            // (4*int.parse(panjangSisiController.text)).toString();
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