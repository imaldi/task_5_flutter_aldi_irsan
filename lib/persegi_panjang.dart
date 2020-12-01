import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class HomePagePersegiPanjang extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Persegi Panjang",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PersegiPanjangPage(title: "Halaman Luas dan Keliling Persegi Panjang"),
    );
  }
}

class PersegiPanjangPage extends StatefulWidget{

  final String title;
  PersegiPanjangPage({Key key, this.title}) : super(key: key);

  @override
  _PersegiPanjangPageState createState() => _PersegiPanjangPageState();

}

class _PersegiPanjangPageState extends State<PersegiPanjangPage> {

  final panjangPersegiPanjangController = TextEditingController();
  final lebarPersegiPanjangController = TextEditingController();
  String hasil = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    panjangPersegiPanjangController.dispose();
    lebarPersegiPanjangController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persegi Panjang Page"),
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
                          controller: panjangPersegiPanjangController,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Silahkan Isi Panjang Persegi Panjang yang mau dihitung";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Panjang",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                          ),
                        ),
                        TextFormField(
                          controller: lebarPersegiPanjangController,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Silahkan Isi Lebar Persegi Panjang yang mau dihitung";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Lebar",
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
                            +(int.parse(panjangPersegiPanjangController.text)*int.parse(lebarPersegiPanjangController.text)).toString());
                      }
                    },),
                  SizedBox(height: 10,),
                  RaisedButton(
                    child: Text("Keliling"),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        setState(() => hasil = "Kelilingnya adalah : "
                            +(2*(int.parse(panjangPersegiPanjangController.text) + int.parse(lebarPersegiPanjangController.text))).toString());
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