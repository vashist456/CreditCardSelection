import 'package:credit_card_picker/views/tab_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: CustomTabController(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
          if (kDebugMode) {
            print('Floating Action Button Pressed');
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

