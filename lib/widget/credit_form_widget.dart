import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

import '../model/credit_model.dart';

class CreditCardForm extends StatefulWidget {
  final void Function(String cardNumber, String expiryDate, String cardHolderName, String cvvCode)? onAddCard;
  final Color themeColor;
  final void Function(CreditCardModel creditCardModel)? onCreditCardModelChange;
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final GlobalKey<FormState>? formKey;
  final List<CreditCard> cards;

  const CreditCardForm({
    Key? key,
    required this.onAddCard,
    this.themeColor = Colors.greenAccent,
    this.onCreditCardModelChange,
    this.cardNumber = '',
    this.expiryDate = '',
    this.cardHolderName = '',
    this.cvvCode = '',
    this.formKey,
    required this.cards,
  }) : super(key: key);

  @override
  State<CreditCardForm> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  bool cvvFocused = false;

  bool get isEditMode => widget.cardHolderName.isNotEmpty;

  void handleAddCard() {
    if (_formKey.currentState!.validate()) {
      String cardHolderName = cardHolderNameController.text;
      String expiryDate = expiryDateController.text.replaceAll('/', '');
      String cvvCode = cvvController.text;
      String cardNumber = cardNumberController.text;

      widget.onAddCard?.call(cardNumber, expiryDate, cardHolderName, cvvCode);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();

    cardHolderNameController.text = widget.cardHolderName;
    expiryDateController.text = widget.expiryDate;
    cvvController.text = widget.cvvCode;
    cardNumberController.text = widget.cardNumber;
  }

  @override
  void dispose() {
    cardHolderNameController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Card' : 'Add Card'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: cardHolderNameController,
                    decoration: const InputDecoration(
                      labelText: 'Card Holder Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the card holder name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: cardNumberController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the card number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          controller: cvvController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(
                            labelText: 'CVV',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the CVV';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              // Handle credit card model change if needed
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: handleAddCard,
                    child: Text(isEditMode ? 'Edit Card' : 'Add Card'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    var newText = '';

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    if (text.length >= 3) {
      newText += '${text.substring(0, 2)}/';
    }

    if (text.length >= 5) {
      newText += text.substring(3, 5);
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CreditCardModel {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  CreditCardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });
}
