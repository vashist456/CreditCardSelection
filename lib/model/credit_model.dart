import 'package:flutter/material.dart';

class CreditCard {
  final String cardNumber;
  final String expiryDate; // Expiry date field
  final String cardHolderName;
  final String cvvCode;

  CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });
}
