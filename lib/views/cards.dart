import 'dart:math';
import 'package:flutter/material.dart';

import '../widget/credit_generic_widget.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  late List<CardData> cards;
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    cards = List.generate(
      10,
          (index) => CardData('Card ${index + 1}', getRandomColor()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 80.0),
        SizedBox( // Wrap ListView.builder with Container
          height: 200.0, // Set a specific height
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: selectedIndex == index ? 0.0 : 1.0,
                    child: Card(
                      elevation: 4,
                      color: card.color,
                      child: SizedBox(
                        width: 200.0, // Width of a normal credit card
                        height: 180.0, // Height of a normal credit card
                        child: ListTile(
                          title: Text(
                            card.title,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (selectedIndex != -1) buildSelectedCard(),
      ],
    );
  }

  Widget buildSelectedCard() {
    final selectedCard = cards[selectedIndex];
    return SizedBox(
      height: 200.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = -1;
          });
        },
        child: GenericCreditWidget(
          cardColor: selectedCard.color,
          cardNumber: selectedCard.title, backCardBackgroundColor: Colors.transparent,
        ),
      ),
    );
  }


  Color getRandomColor() {
    final random = Random();
    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);
    return Color.fromARGB(255, r, g, b);
  }
}

class CardData {
  final String title;
  final Color color;

  CardData(this.title, this.color);
}
