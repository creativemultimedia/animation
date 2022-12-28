import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  List l=[];
  bool temp=false;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get() async {
  var uri=Uri.parse("https://cdmicreative.000webhostapp.com/view_data.php");
  var response = await http.get(uri);

  if(response.statusCode==200){
    Map m=jsonDecode(response.body);
    print(m);

    if(m['status']==1){
        l=m['result'];

       print(l);
       temp=true;
    }

  }
  setState(() {

  });
 // print("Hello");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Helo"),
      ),
      body: temp ? ListView.builder(itemCount: l.length,itemBuilder: (context, index) {
        return ListTile(title: Text("${l[index]['name']}"),);
      },) : CircularProgressIndicator(),
    );
  }
}
