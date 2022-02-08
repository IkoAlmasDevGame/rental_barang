import 'package:flutter/material.dart';
import 'Home.dart';

void main(){
  runApp(MyAppRental());
}

class MyAppRental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Rental',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      color: Colors.blueGrey,
      home: HomePage(),
    );
  }
}
