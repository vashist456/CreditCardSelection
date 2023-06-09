import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
Widget creditCardWidget({
  required String cardNumber,
  required String expiryDate,
  required String cardHolderName,
  required String cvvCode,
  required bool isCvvFocused,
  required String backgroundImage,
  required Color cardBgColor,
  required Glassmorphism glassmorphismConfig,
  required bool obscureCardNumber,
  required bool obscureCardCvv,
  required bool isHolderNameVisible,
  required TextStyle textStyle,
  required bool isChipVisible,
  required bool isSwipeGestureEnabled,
  required Duration animationDuration,
  required Border frontCardBorder,
  required Border backCardBorder,
  required List<CustomCardTypeImage> customCardIcons,
  required BoxDecoration frontCardDecoration,
  required BoxDecoration backCardDecoration,
  required Function(CreditCardBrand) onCreditCardWidgetChange,
}) {
  return SizedBox(
    height: 175,
    child: CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,

      cardBgColor: cardBgColor,
      glassmorphismConfig: glassmorphismConfig,
      backgroundImage: backgroundImage,
      obscureCardNumber: obscureCardNumber,
      obscureCardCvv: obscureCardCvv,
      isHolderNameVisible: isHolderNameVisible,
      textStyle: textStyle,
      isChipVisible: isChipVisible,
      isSwipeGestureEnabled: isSwipeGestureEnabled,
      animationDuration: animationDuration,
      frontCardBorder: frontCardBorder,
      backCardBorder: backCardBorder,

      onCreditCardWidgetChange: onCreditCardWidgetChange,
      showBackView: false,
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
