import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_api/user.dart';

void main() => runApp(Home());
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Users(),
    );
  }
}