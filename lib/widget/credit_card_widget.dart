import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

Widget creditCardWidget({
  required String cardNumber,
  required String expiryDate,
  required String cardHolderName,
  required String cvvCode,
  required bool isCvvFocused,
  String? backgroundImage,
  bool? obscureCardNumber,
  bool? obscureCardCvv,
  bool? isHolderNameVisible,
  TextStyle? textStyle,
  bool? isChipVisible,
  required bool isSwipeGestureEnabled,
  BoxBorder? frontCardBorder,
  BoxBorder? backCardBorder,
  required Function(CreditCardBrand) onCreditCardWidgetChange,
  required List<Widget> customCardIcons,
  required BoxDecoration? frontCardDecoration,
  required BoxDecoration? backCardDecoration,
}) {
  return SizedBox(
    height: 175,
    child: CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      backgroundImage: backgroundImage,
      obscureCardNumber: false,
      obscureCardCvv: true ,
      isHolderNameVisible: false,
      textStyle: textStyle,
      isChipVisible: true,
      animationDuration: const Duration(milliseconds: 100),
      frontCardBorder: frontCardBorder,
      backCardBorder: backCardBorder,
      onCreditCardWidgetChange: onCreditCardWidgetChange,
      showBackView: true,
    ),
  );
}

class CustomCardTypeImage {
  final CardType cardType;
  final Widget cardImage;

  CustomCardTypeImage({
    required this.cardType,
    required this.cardImage,
  });
}
