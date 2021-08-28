import 'package:auction_app/presentation/screen/signup/google_sign_in.dart';
import 'package:auction_app/core/utils/resources.dart';
import 'package:auction_app/data/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  // static const padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    final user = UserModel(
      uid: firebaseUser?.uid,
      name: firebaseUser?.displayName,
      email: firebaseUser?.email,
      imageURL: firebaseUser?.photoURL,
    );
    return Drawer(
      child: Material(
        color: ColorResources.DRAWER_BG,
        child: ListView(
          // padding: padding,
          children: [
            buildHeader(
              name: user.name,
              email: user.email,
              imgURL: user.imageURL,
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: ColorResources.DRAWER_DIVIDER_COLOR),
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.account_circle,
              // onClicked: () => Navigator.pushNamed(context, '/'),
            ),
            buildMenuItem(
              text: 'My posted items',
              icon: Icons.format_list_bulleted,
              // onClicked: () => Navigator.pushNamed(context, '/'),
              onClicked: () {
                Navigator.pushNamed(context, '/my-items', arguments: user);
              },
            ),
            buildMenuItem(
              text: 'Sign out',
              icon: Icons.logout_rounded,
              // onClicked: () => Navigator.pushNamed(context, '/'),
              onClicked: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: ColorResources.DRAWER_DIVIDER_COLOR),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onClicked,
    );
  }

  Widget buildHeader({
    required String? imgURL,
    required String? name,
    required String? email,
  }) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
        ),
      ),
    );
  }
}
