import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void loginWithGoogle() {
    //TO-DO: Login function
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/background.svg",
            colorFilter: const ColorFilter.mode(
                Color.fromARGB(255, 22, 22, 22), BlendMode.srcIn),
          ),
          Stack(
            children: [
              const Align(
                alignment: Alignment(-.75, 0),
                child: Image(
                  image: AssetImage("assets/images/ioetLogoLeft.png"),
                  width: 150,
                  height: 150,
                ),
              ),
              Align(alignment: Alignment.centerRight, child: _ioetImageHalf())
            ],
          ),
          Expanded(
              flex: 1,
              child: Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    width: 225,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: loginWithGoogle,
                      child: Row(
                        children: [
                          SvgPicture.network(
                              "https://fonts.gstatic.com/s/i/productlogos/googleg/v6/24px.svg"),
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: const Text(
                              "Sign in with Google",
                              style: TextStyle(
                                  fontFamily: "Barlow", color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )),
              )))
        ],
      ),
    );
  }

  Widget _ioetImageHalf() {
    return ClipRect(
      child: Align(
        alignment: Alignment.centerLeft,
        widthFactor: .5,
        child: Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Image.asset(
                "assets/images/ioetLogo.png",
                width: 500,
                height: 500,
              ),
            ),
            Image.asset(
              "assets/images/ioetLogo.png",
              width: 500,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
