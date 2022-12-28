import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation? animation;

  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this);
    animation = CurvedAnimation(parent: controller!, curve: Curves.slowMiddle);

    controller!.forward();
    animation!.addListener(() => setState(() {}));

    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) controller!.reverse(from: 400);
      else if (status == AnimationStatus.dismissed) controller!.forward();
    });
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


