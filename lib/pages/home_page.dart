import 'package:flutter/material.dart';
import 'package:ioet_lunch_n_learn_frontend/widgets/drawer.dart';
import 'package:ioet_lunch_n_learn_frontend/widgets/house_identifier.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actionsIconTheme: const IconThemeData(color: Colors.white),
          leading: Container(),
        ),
        endDrawer: OptionsDrawer(),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [HouseIdentifier()],
              ),
            )
          ],
        ));
  }
}
