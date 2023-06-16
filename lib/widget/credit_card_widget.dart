import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';
  String cardHolderName = '';
  String cvvNumber = '';
  String expiryDate = '';
  bool showBackView = false;
  bool cvvFocused = true;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      expiryDate = creditCardModel.expiryDate;
      cvvNumber = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
      cvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            cvvFocused = !cvvFocused;
          });
        },
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              showBackView: showBackView,
              cardBgColor: Colors.greenAccent,
              textStyle: const TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: const Duration(milliseconds: 1200),
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
            ),
            if (cvvFocused)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  cvvNumber,
                  style: const TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
