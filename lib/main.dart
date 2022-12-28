import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlypractice/tweenanimation.dart';
import 'package:onlypractice/second.dart';


void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
TextEditingController t1=TextEditingController();
TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Insert Data"),
        ),
        body:
       Column(children: [
         TextField(controller: t1,),
         TextField(controller: t2,),
         ElevatedButton(onPressed: () async {
          String name=t1.text;
          String contact=t2.text;
          var url=Uri.parse("https://cdmicreative.000webhostapp.com/add_data.php?name=$name&contact=$contact");
          var response = await http.get(url);
          print("Response:${response.body}");
          print("ResponseCode=${response.statusCode}");

         }, child: Text("Submit")),
         ElevatedButton(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) {
             return Second();
           },));
         }, child: Text("VIew"))

       ],)


    );
  }
}
