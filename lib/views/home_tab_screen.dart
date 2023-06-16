import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Hometab extends StatefulWidget {
  const Hometab({Key? key,
    required String cardNumber,
    required String cardHolderName,
    required String cvvNumber,
    required String expiryDate}) : super(key: key);

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  String cardNumber = '1234 5678 9012 3456';
  String cardHolderName = 'John Doe';
  String cvvNumber = '123';
  String expiryDate = '12/24';
  bool showBackView = false;

  void toggleCardView() {
    setState(() {
      showBackView = !showBackView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: toggleCardView,
            child: CreditCardWidget(
              bankName: 'American Express',
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              showBackView: showBackView,
              cardBgColor: Colors.greenAccent,
              textStyle: const TextStyle(
                color: Colors.black, // Set the font color to black
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: const Duration(milliseconds: 1200),
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pending Amount: \$100',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Due Date: June 30, 2023',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
