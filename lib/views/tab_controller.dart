import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomTabController extends StatefulWidget {
  const CustomTabController({Key? key}) : super(key: key);

  @override
  _CustomTabControllerState createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController>
    with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  late TabController _tabController;
  final bool _showBackView = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    // Add your refresh logic here
    // For example, you can fetch updated data from a server
    // or update the UI based on new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card Options'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              'Credit Card Options',
              style: TextStyle(fontSize: 30, fontFamily: 'BigAppText'),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: 40,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(
                    child: Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Card",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: _handleRefresh,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return creditCardWidget(
                        cardNumber: '1234 5678 9012 3456',
                        expiryDate: '12/23',
                        cardHolderName: 'John Doe',
                        cvvCode: '123',
                        backgroundImage: 'assets/images/card_background.png',
                        cardBgColor: Colors.black.withOpacity(0.8),
                        obscureCardNumber: true,
                        obscureCardCvv: true,
                        isHolderNameVisible: true,
                        textStyle: const TextStyle(),
                        isChipVisible: true,
                        isSwipeGestureEnabled: true,
                        animationDuration: const Duration(milliseconds: 300),

                        onCreditCardWidgetChange: (creditCardBrand) {},
                        showBackView: _showBackView,
                        customCardIcons: const [],
                      );
                    },
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                       ...List.generate(10, (index) => GestureDetector(
                              onTap: () {},
                              child: creditCardWidget(
                                cardNumber: '1234 5678 9012 3456',
                                expiryDate: '12/23',
                                cardHolderName: 'John Doe',
                                cvvCode: '123',
                                backgroundImage: 'assets/images/card_background.png',
                                cardBgColor: Colors.black.withOpacity(0.8),
                                obscureCardNumber: true,
                                obscureCardCvv: true,
                                isHolderNameVisible: true,
                                textStyle: const TextStyle(),
                                isChipVisible: true,
                                isSwipeGestureEnabled: true,
                                animationDuration: const Duration(milliseconds: 300),
                                onCreditCardWidgetChange: (creditCardBrand) {},
                                showBackView: _showBackView,
                                customCardIcons: const [],
                              ),
                            ),

                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget creditCardWidget({
  required String cardNumber,
  required String expiryDate,
  required String cardHolderName,
  required String cvvCode,
  required String backgroundImage,
  required Color cardBgColor,
  required bool obscureCardNumber,
  required bool obscureCardCvv,
  required bool isHolderNameVisible,
  required TextStyle textStyle,
  required bool isChipVisible,
  required bool isSwipeGestureEnabled,
  required Duration animationDuration,

  required Function(CreditCardBrand) onCreditCardWidgetChange,
  required bool showBackView,
  required List<CustomCardTypeIcon> customCardIcons,
}) {

  return SizedBox(
    height: 175,
    child: CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      cardBgColor: cardBgColor,
      backgroundImage: backgroundImage,
      obscureCardNumber: obscureCardNumber,
      obscureCardCvv: obscureCardCvv,
      isHolderNameVisible: isHolderNameVisible,
      textStyle: textStyle,
      isChipVisible: isChipVisible,
      isSwipeGestureEnabled: isSwipeGestureEnabled,
      animationDuration: animationDuration,

      onCreditCardWidgetChange: onCreditCardWidgetChange,
      showBackView: showBackView,

    ),
  );
}

class CustomCardTypeIcon {
  final CardType cardType;
  final Widget cardIcon;

  CustomCardTypeIcon({
    required this.cardType,
    required this.cardIcon,
  });
}
List<CustomCardTypeIcon> customCardIcons = [
  CustomCardTypeIcon(
    cardType: CardType.visa,
    cardIcon: Icon(Icons.payment),
  ),
  CustomCardTypeIcon(
    cardType: CardType.mastercard,
    cardIcon: Icon(Icons.payment),
  ),
  // Add more custom card type icons if needed
];


