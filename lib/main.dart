import 'package:culmyca_app/screens/dashboard.dart';
import 'package:culmyca_app/screens/login.dart';
import 'package:culmyca_app/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool isLoading = true;
bool isUserExists = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    getUserData();
  }

  void getUserData() async {
    //get if user exits or not
  }

  @override
  Widget build(BuildContext context) {
    return !isUserExists?Welcome():DashBoard();
  }
}
