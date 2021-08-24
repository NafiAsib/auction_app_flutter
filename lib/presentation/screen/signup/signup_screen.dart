import 'package:auction_app/core/provider/google_sign_in.dart';
import 'package:auction_app/core/utils/resources.dart';
import 'package:auction_app/presentation/utils/decorations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(
          // title: Text('Login'),
          ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Center(
            child: Container(
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
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
                children: [
                  Container(
                    child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          ),
          // InkWell(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.red,
          //       ),
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     width: 300,
          //     height: 80,
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           child: Image.network(
          //             'http://pngimg.com/uploads/google/google_PNG19635.png',
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         Text('Sign in with Google')
          //       ],
          //     ),
          //   ),
          //   onTap: () {},
          // ),
        ],
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
