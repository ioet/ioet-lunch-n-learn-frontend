import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Stack(
        children: [
          Image(
            image: AssetImage("assets/images/ioetLogoLeft.png"),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
