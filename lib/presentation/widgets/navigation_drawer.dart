import 'package:auction_app/core/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  // static const padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName;
    final email = user?.email;
    final imgURL = user?.photoURL;
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          // padding: padding,
          children: [
            buildHeader(
              name: name,
              email: email,
              imgURL: imgURL,
              // onClicked: () =>
            ),
            SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'Nafi',
            ),
            Divider(color: Colors.white70),
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
  }) {
    final color = Colors.white;
    return ListTile(title: Text(text), onTap: () {});
  }

  Widget buildHeader({
    required String? imgURL,
    required String? name,
    required String? email,
  }) =>
      InkWell(
          child: Container(
              // padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
              child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imgURL!),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                email!,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Spacer(),
        ],
      )));
}
