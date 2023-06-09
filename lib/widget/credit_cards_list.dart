import 'package:credit_card_picker/widget/credit_generic_widget.dart';
import 'package:credit_card_picker/widget/credit_generic_widget.dart';
import 'package:flutter/material.dart';



class BuildGenericCreditCard extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const BuildGenericCreditCard({
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 200,
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Card Details',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Card Number',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Card Holder',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Expiry Date',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}