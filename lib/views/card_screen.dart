import 'package:flutter/material.dart';

// Make sure to import the correct route

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // ignore: prefer_const_constructors
          child: Text('Go to Settings'),
          onPressed: () {},
        ),
      ),
    );
  }
}
