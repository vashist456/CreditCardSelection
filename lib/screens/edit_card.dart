import 'package:flutter/material.dart';
import '../model/credit_model.dart';

class EditCard extends StatefulWidget {
  final CreditCard creditCard;

  const EditCard({Key? key, required this.creditCard}) : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  late TextEditingController cardNumberController;
  late TextEditingController expiryDateController;
  late TextEditingController cardHolderNameController;
  late TextEditingController cvvCodeController;

  @override
  void initState() {
    super.initState();
    cardNumberController = TextEditingController(text: widget.creditCard.cardNumber);
    expiryDateController = TextEditingController(text: widget.creditCard.expiryDate);
    cardHolderNameController = TextEditingController(text: widget.creditCard.cardHolderName);
    cvvCodeController = TextEditingController(text: widget.creditCard.cvvCode);
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvCodeController.dispose();
    super.dispose();
  }

  void saveChanges() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Changes'),
          content: const Text('Are you sure you want to apply these changes?'),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                final updatedCard = CreditCard(
                  cardNumber: cardNumberController.text,
                  expiryDate: expiryDateController.text,
                  cardHolderName: cardHolderNameController.text,
                  cvvCode: cvvCodeController.text,
                );
                Navigator.of(context).pop(updatedCard); // Return the updated card to the previous screen
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Apply'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            TextField(
              controller: expiryDateController,
              decoration: const InputDecoration(
                labelText: 'Expiry Date',
              ),
            ),
            TextField(
              controller: cardHolderNameController,
              decoration: const InputDecoration(
                labelText: 'Card Holder Name',
              ),
            ),
            TextField(
              controller: cvvCodeController,
              decoration: const InputDecoration(
                labelText: 'CVV Code',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
