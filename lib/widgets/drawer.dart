import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ioet_lunch_n_learn_frontend/components/neon_text.dart';
import 'package:ioet_lunch_n_learn_frontend/pages/home_page.dart';
import 'package:ioet_lunch_n_learn_frontend/pages/login_page.dart';
import 'package:logger/logger.dart';

class OptionsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<NeontextModel> options = [
      NeontextModel(35, "Gobold Bold", 75, const Color(0xffff5e0a),
          "Release Trivia", Colors.white, () => {}),
      NeontextModel(35, "Gobold Bold", 75, const Color(0xffff5e0a),
          "Create Trivia", Colors.white, () => {}),
      NeontextModel(35, "Gobold Bold", 75, const Color(0xffff5e0a),
          "L&L Trivia", Colors.white, () => {}),
      NeontextModel(35, "Gobold Bold", 75, const Color(0xffc800b4), "My House",
          Colors.white, () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }),
    ];
    List<Widget> neonTextOptions =
        options.map((option) => neonTextWidget(option)).toList();
    return Drawer(
      width: 430,
      backgroundColor: Colors.black,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: TextButton(
                          onPressed: () {
                            signOut(context);
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Gobold Bold",
                                fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(75),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: neonTextOptions,
                  ),
                ),
              )),
          Expanded(
            child: Container(
                alignment: Alignment.bottomCenter,
                child: const Image(
                  image: AssetImage("assets/images/ioetLogoLeft.png"),
                  width: 100,
                )),
          )
        ],
      ),
    );
  }

  void signOut(BuildContext context) {
    var logger = Logger();
    try {
      FirebaseAuth.instance.signOut();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } on Exception catch (exception) {
      logger.e("Exception: $exception");
    }
  }
}
