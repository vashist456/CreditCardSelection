import 'package:flutter/material.dart';

class GenericCreditWidget extends StatelessWidget {
  final Color cardColor;
  final Color frontCardBackgroundColor;
  final Color backCardBackgroundColor;
  final double height;
  final double width;
  final bool isChipVisible;
  final String cardNumber;
  final String expiryDate;
  final String cvvCode;
  final bool obscureCardNumber;
  final bool obscureCardCvv;
  final bool isHolderNameVisible;

  const GenericCreditWidget({
    Key? key,
    this.cardColor = Colors.white,
    this.frontCardBackgroundColor = Colors.transparent,
    required this.backCardBackgroundColor,
    this.height = 200,
    this.width = 300,
    this.isChipVisible = true,
    this.cardNumber = '**** **** **** ****',
    this.expiryDate = 'MM/YY',
    this.cvvCode = '****',
    this.obscureCardNumber = true,
    this.obscureCardCvv = true,
    this.isHolderNameVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: frontCardBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isChipVisible) _buildChipPlaceholder(),
                  _buildCardNumber(),
                  _buildExpiryDateAndCVV(),
                  if (isHolderNameVisible) _buildCardHolderName(),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: backCardBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipPlaceholder() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Container(
        width: 48,
        height: 32,
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget _buildCardNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16),
      child: Text(
        obscureCardNumber ? '**** **** **** ****' : cardNumber,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildExpiryDateAndCVV() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16),
      child: Row(
        children: [
          Text(
            expiryDate,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            obscureCardCvv ? '****' : cvvCode,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardHolderName() {
    return const Padding(
      padding: EdgeInsets.only(top: 8, left: 16),
      child: Text(
        'NAME',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
