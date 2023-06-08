import 'package:credit_card_picker/views/card_screen.dart';
import 'package:credit_card_picker/views/cards.dart';
import 'package:flutter/material.dart';

class CustomTabController extends StatelessWidget {
  const CustomTabController({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Home',
                ),
              ),
              Tab(
                child: Text(
                  'Card',
                ),
              ),
            ],
          ),
      SizedBox(
        height: 100,
        child: TabBarView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      'Home Screen',
                      style: TextStyle(
                        color: Colors. black,
                        fontSize: 30,
                        fontFamily: 'BigAppText',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300.0,
                  ),
                  child: Cards(),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: const Text('Go to Card Screen'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Card Tab',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    ],
      ),
    );
  }
}
