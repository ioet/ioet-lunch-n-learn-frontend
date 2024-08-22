import 'package:flutter/material.dart';
import 'package:ioet_lunch_n_learn_frontend/components/circular_progress_bar.dart';

class UserModel {}

class HouseIdentifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: const RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Learning",
                  style: TextStyle(
                      color: Color.fromRGBO(39, 39, 39, 0.49),
                      fontSize: 200,
                      fontFamily: "Gobold Extra1"),
                ),
              ),
            ),
            const Image(
              image: AssetImage("assets/images/Babbage.png"),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 6, color: const Color.fromRGBO(27, 27, 27, 1)),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    "House Points",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Gobold Bold",
                        fontSize: 20),
                  )
                ],
              ),
              const Divider(
                indent: .5,
                endIndent: .5,
                color: Color.fromRGBO(27, 27, 27, 1),
                thickness: 5,
              ),
              Row(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Stack(
                        children: [
                          CircularProgressBar(
                            value: 0.25,
                            totalValue: 500,
                            color: Colors.red,
                          )
                        ],
                      ),
                      Container(
                        child: Image.asset(
                          "assets/images/caption.png",
                          height: 80,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(1000),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(47, 130, 219, 1),
                        spreadRadius: 1,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 20)
                  ]),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/ioetLogo.png"),
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      "House Value: Learning",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Gobold Bold"),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
