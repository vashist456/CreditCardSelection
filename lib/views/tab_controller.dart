// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/credit_card_brand.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:credit_card_validator/credit_card_validator.dart';
//
// class CustomTabController extends StatefulWidget {
//   final List<CreditCardModel> creditCards;
//
//   const CustomTabController({Key? key, required this.creditCards})
//       : super(key: key);
//
//   @override
//   _CustomTabControllerState createState() => _CustomTabControllerState();
// }
//
// class _CustomTabControllerState extends State<CustomTabController>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final bool _showBackView = false;
//   int cardCount = 0;
//
//   CreditCardValidator detectCCType(String cardNumber) {
//     return CreditCardValidator();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   void addCard() {
//     setState(() {
//       cardCount++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 30),
//         Container(
//           margin: const EdgeInsets.only(left: 20),
//           child: const Text(
//             'Credit Card Options',
//             style: TextStyle(fontSize: 30, fontFamily: 'BigAppText'),
//           ),
//         ),
//         const SizedBox(height: 30),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 30),
//               Center(
//                 child: SizedBox(
//                   height: 40,
//                   child: TabBar(
//                     controller: _tabController,
//                     isScrollable: true,
//                     labelPadding: const EdgeInsets.symmetric(horizontal: 20),
//                     indicatorColor: Colors.black,
//                     indicatorSize: TabBarIndicatorSize.label,
//                     tabs: [
//                       const Tab(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.home,
//                               color: Colors.black,
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "Home",
//                               style:
//                               TextStyle(color: Colors.black, fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Tab(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.credit_card,
//                               color: Colors.black,
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "Card",
//                               style:
//                               TextStyle(color: Colors.black, fontSize: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: [
//                     ListView.builder(
//                       itemCount: widget.creditCards.length + cardCount,
//                       itemBuilder: (context, index) {
//                         if (index < widget.creditCards.length) {
//                           final card = widget.creditCards[index];
//                           return GestureDetector(
//                             onTap: () {},
//                             child: buildCreditCardWidget(
//                               cardNumber: card.cardNumber,
//                               expiryDate: card.expiryDate,
//                               cardHolderName: card.cardHolderName,
//                               cvvCode: card.cvvCode,
//                               cardBgColor: Colors.black.withOpacity(0.8),
//                               showBackView: _showBackView,
//                             ),
//                           );
//                         } else {
//                           return GestureDetector(
//                             onTap: () {},
//                             child: buildCreditCardWidget(
//                               cardNumber: '',
//                               expiryDate: '',
//                               cardHolderName: 'John Doe',
//                               cvvCode: '',
//                               cardBgColor: Colors.black.withOpacity(0.8),
//                               showBackView: _showBackView,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                     ListView.builder(
//                       itemCount: 1,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {},
//                           child: buildCreditCardWidget(
//                             cardNumber: '',
//                             expiryDate: '',
//                             cardHolderName: 'John Doe',
//                             cvvCode: '',
//                             cardBgColor: Colors.black.withOpacity(0.8),
//                             showBackView: _showBackView,
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               if (_tabController.index == 1)
//                 Container(
//                   alignment: Alignment.center,
//                   child: OutlinedButton(
//                     onPressed: () {
//                       // Handle button tap
//                     },
//                     child: const Text(
//                       'Expiry Dates',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildCreditCardWidget({
//     required String cardNumber,
//     required String expiryDate,
//     required String cardHolderName,
//     required String cvvCode,
//     required Color cardBgColor,
//     required bool showBackView,
//   }) {
//     return CreditCardWidget(
//       cardNumber: cardNumber,
//       expiryDate: expiryDate,
//       cardHolderName: cardHolderName,
//       cvvCode: cvvCode,
//       cardBgColor: cardBgColor,
//       showBackView: showBackView,
//       onCreditCardWidgetChange: (CreditCardBrand cardBrand) {
//         final cardType = cardBrand;
//         switch (cardType) {
//           case CardType.visa:
//           // Handle Visa card changes
//             break;
//           case CardType.mastercard:
//           // Handle Mastercard changes
//             break;
//           case CardType.americanExpress:
//           // Handle American Express card changes
//             break;
//         // Add more cases for other credit card brands
//         }
//       },
//     );
//   }
// }
