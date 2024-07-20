import 'package:flutter/material.dart';
import 'package:geo_locator/home_page.dart';

void main() {
  runApp(Sub7an_Allah());
}

class Sub7an_Allah extends StatelessWidget {
  const Sub7an_Allah({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "PlaywriteAUVIC"),
      debugShowCheckedModeBanner: false,
      home: home_page(),
    );
  }
}
