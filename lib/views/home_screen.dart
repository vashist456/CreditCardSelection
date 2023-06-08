import 'package:credit_card_picker/views/tab_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),

      body:const SingleChildScrollView(
           child: CustomTabController(),
              ),
      // body: DefaultTabController(
      //   length: 2,
      //   child: Column(
      //     children: [
      //       TabBar(
      //         labelColor: Colors.black, // Set the label/text color to black
      //         tabs: const [
      //           Tab(
      //             child: Text(
      //               'Home',
      //               style: TextStyle(
      //                 color: Colors.black, // Set the text color to black
      //               ),
      //             ),
      //           ),
      //           Tab(
      //             child: Text(
      //               'Card',
      //               style: TextStyle(
      //                 color: Colors.black, // Set the text color to black
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Expanded(
      //         child: TabBarView(
      //           children: [
      //             // Your Home content
      //             const Text('Home Screen'),
      //             // Your Card content
      //             const Text('Card content'),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

    );
  }
}
