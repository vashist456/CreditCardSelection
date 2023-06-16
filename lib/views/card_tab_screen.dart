import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../model/credit_model.dart';
import '../screens/edit_card.dart';
import '../widget/credit_form_widget.dart';

class CardTab extends StatefulWidget {
  final List<CreditCard> cards;
  final void Function(String cardNumber, String expiryDate, String cardHolderName, String cvvCode) onAddCard;

  const CardTab({Key? key, required this.cards, required this.onAddCard}) : super(key: key);

  @override
  _CardTabState createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  late List<CreditCard> cards;
  late ValueNotifier<CreditCard> editedCardNotifier;

  @override
  void initState() {
    super.initState();
    cards = widget.cards;
    editedCardNotifier = ValueNotifier<CreditCard>(CreditCard(cardNumber: '', expiryDate: '', cardHolderName: '', cvvCode: ''));
  }

  void addCard(CreditCard creditCard) {
    setState(() {
      cards.add(creditCard);
      widget.cards.add(creditCard); // Update the widget.cards list as well
    });
  }

  void editCard(int index) async {
    final editedCard = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCard(
          creditCard: cards[index],
        ),
      ),
    );
    if (editedCard != null) {
      updateCard(index, editedCard);
    }
  }

  void updateCard(int index, CreditCard updatedCard) {
    setState(() {
      cards[index] = updatedCard;
      editedCardNotifier.value = updatedCard;
    });
  }

  void deleteCard(int index) {
    setState(() {
      cards.removeAt(index);
      widget.cards. removeAt(index); // Update the widget.cards list as well
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cards.isNotEmpty
          ? ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final creditCard = cards[index];
          return ListTile(
            title: CreditCardWidget(
              cardNumber: creditCard.cardNumber,
              expiryDate: creditCard.expiryDate,
              cardHolderName: creditCard.cardHolderName,
              cvvCode: creditCard.cvvCode,
              showBackView: false,
              cardBgColor: Colors.greenAccent,
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: const Duration(milliseconds: 1200),
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
            ),
            trailing: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ];
              },
              onSelected: (String value) {
                if (value == 'edit') {
                  editCard(index);
                } else if (value == 'delete') {
                  deleteCard(index);
                }
              },
            ),
          );
        },
      )
          : const SizedBox(), // Return an empty SizedBox if cards list is empty
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreditCardForm(
                onAddCard: (cardNumber, expiryDate, cardHolderName, cvvCode) {
                  final newCard = CreditCard(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                  );
                  addCard(newCard);
                  widget.onAddCard(cardNumber, expiryDate, cardHolderName, cvvCode);
                },
                cards: cards,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
