import 'package:auction_app/core/utils/resources.dart';
import 'package:auction_app/presentation/utils/decorations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:firebase_core/firebase_core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // TextEditingController emailController = TextEditingController();
    // TextEditingController passwdController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          // title: Text('Login'),
          ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Text('Auction App'),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.google,
                      color: ColorResources.G_ICON_COLOR),
                  label: Text('Login with Google!'),
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    SizedBox(
                      width: 4.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Sign Up!',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // body: SafeArea(
      //   child: Container(
      //     padding: EdgeInsets.all(16.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Column(
      //           children: [
      //             Text(
      //               'Auction App',
      //             ),
      //             SizedBox(
      //               height: 60,
      //             ),
      //             TextFormField(
      //               controller: emailController,
      //               decoration: inputFocusedBorder.copyWith(
      //                 icon: Icon(
      //                   Icons.person,
      //                   color: ColorResources.FORM_ICON_COLOR,
      //                 ),
      //                 hintText: 'Password',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 16.0,
      //             ),
      //             TextFormField(
      //               controller: passwdController,
      //               decoration: inputFocusedBorder.copyWith(
      //                 icon: Icon(
      //                   Icons.lock,
      //                   color: ColorResources.FORM_ICON_COLOR,
      //                 ),
      //                 hintText: 'Password',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 30,
      //             ),
      //             ElevatedButton(
      //               // style: style,
      //               onPressed: () {},
      //               child: const Text('Login'),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('Don\'t have an account?'),
      //             SizedBox(width: 5),
      //             Text('Sign Up'),
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
