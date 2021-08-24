import 'package:auction_app/core/provider/google_sign_in.dart';
import 'package:auction_app/core/routes/route_generator.dart';
import 'package:auction_app/presentation/screen/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
        // home: Container(
        //   child: Text('Hello'),
        // ),
      ),
    );
  }
}
