import 'package:flutter/material.dart';
import 'package:credit_card_picker/views/card_tab_screen.dart';
import 'package:credit_card_picker/widget/credit_form_widget.dart';

import 'model/credit_model.dart';

class MyHomePage extends StatefulWidget {
  final void Function(String, String, String, String)? onAddCard;

  const MyHomePage({Key? key, this.onAddCard}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController controller;
  int activeCardIndex = 0;
  List<CreditCard> cards = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleAddCard(String cardNumber, String expiryDate, String cardHolderName, String cvvCode) {
    setState(() {
      cards.add(CreditCard(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab ${controller.index + 1}'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Tab1(Home)', icon: Icon(Icons.home)),
            Tab(text: 'Tab2(Card)', icon: Icon(Icons.credit_card)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          _HomeTab(
            cardNumber: '1234 5678 9012 3456',
            cardHolderName: 'John Doe',
            cvvNumber: '123',
            expiryDate: '12/24',
          ),
          CardTab(
            onAddCard: widget.onAddCard ?? _handleAddCard,
            cards: cards,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreditCardForm(onAddCard: _handleAddCard, cards: const [],)),
          ).then((value) {
            if (value != null && widget.onAddCard != null) {
              widget.onAddCard!(
                value.cardNumber,
                value.expiryDate,
                value.cardHolderName,
                value.cvvCode,
              );
            }
          });
        },
        tooltip: 'Add Card Details',
        child: const Icon(Icons.add, size: 22),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String cvvNumber;
  final String expiryDate;

  const _HomeTab({
    Key? key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.cvvNumber,
    required this.expiryDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Home Tab');
  }
}
