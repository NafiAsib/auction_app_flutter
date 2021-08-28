import 'package:auction_app/core/utils/notifier_state.dart';
import 'package:auction_app/core/utils/resources.dart';
import 'package:auction_app/presentation/screen/signup/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GoogleSignInProvider>(builder: (context, value, child) {
        if (value.notifierState == NotifierState.LOADING) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/logo-1.svg',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                child: Container(
                  width: 300,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: SvgPicture.asset(
                        'assets/google-icon.svg',
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: ColorResources.BUTTON_PRIMARY_BG,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40), // <-- Radius
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
