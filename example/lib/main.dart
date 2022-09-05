import 'package:flutter/material.dart';
import 'package:holdnload/holdnload.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: HoldAndLoad(
          controller: ShootingController(ShootingValue(false, false)),
          isShootingButtonAnimate: false,
          style: Style.withGradientColor(
              outerSize: const Size.square(115),
              innerSize: const Size.square(82),
              outerColor: Colors.white,
              progressColor: Colors.redAccent,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF00AACE),
                  Color(0xFF006BCE),
                ],
              ),
              progressWidth: 3,
              outerWidth: 4),
          callBackShootingEnd: () {},
          callBackShootingStart: () {},
          listener: () {
          },
          child: Image.asset(
            'assets/images/video.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
