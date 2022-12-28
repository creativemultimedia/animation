import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController? controller;

  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this); // Links this controller to this widget so it won't run if the parent widget isn't rendered, to save on resources.

    controller!.forward();
    controller!.addListener(() => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Opacity(
          opacity: controller!.value,
          child: Container(width: 50, height: 50, color: Colors.red),
        ),
      ),
    );
  }
}


