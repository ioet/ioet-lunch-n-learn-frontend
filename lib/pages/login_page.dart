import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ioet_lunch_n_learn_frontend/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValueNotifier userCredential = ValueNotifier('');

  void onPressed() async {
    Firebase.initializeApp();
    userCredential.value = await signInWithGoogle();
    if (userCredential.value != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      print('exception->$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/background.svg",
          colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 22, 22, 22), BlendMode.srcIn),
        ),
        Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 1.1),
            child: const Image(
              image: AssetImage("assets/images/ioetLogoBlur.png"),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage("assets/images/ioetLogoLeft.png"),
            width: 250,
          ),
        ),
        Align(
          alignment: const Alignment(0, .75),
          child: SizedBox(
              width: 225,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: onPressed,
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
        )
      ],
    );
  }
}
