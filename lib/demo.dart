import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

void main() {
  runApp(MaterialApp(
    home: Demo(),
  ));
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ScreenLock(
          correctString: '1234', onUnlocked: () {
          print("Hello");
        },
        ),
      ),
    );
  }
}
