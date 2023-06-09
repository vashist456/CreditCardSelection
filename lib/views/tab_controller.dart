import 'package:credit_card_picker/widget/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

class CustomTabController extends StatefulWidget {
  const CustomTabController({Key? key}) : super(key: key);

  @override
  _CustomTabControllerState createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showBackView = false;

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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 500,
        child: Column(
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
              child: SizedBox(
                height: 1000, // Adjust the height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: () {  },
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _showBackView = !_showBackView;
                              });
                            },
                            child: Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: creditCardWidget(
                                  cardNumber: '1234 5678 9012 3456',
                                  expiryDate: '12/23',
                                  cardHolderName: 'John Doe',
                                  cvvCode: '123',
                                  isCvvFocused: false,
                                  backgroundImage: 'assets/card_background.jpg',
                                  cardBgColor: Colors.black.withOpacity(0.8),
                                  // glassmorphismConfig: glassmorphismConfig,
                                  obscureCardNumber: true,
                                  obscureCardCvv: true,
                                  isHolderNameVisible: true,
                                  textStyle: const TextStyle(),
                                  isChipVisible: true,
                                  isSwipeGestureEnabled: true,
                                  animationDuration: const Duration(milliseconds: 300),
                                  frontCardBorder: const Border(),
                                  backCardBorder: const Border(),
                                  onCreditCardWidgetChange: (creditCardBrand) {},
                                  glassmorphismConfig: null,
                                  customCardIcons: [],
                                  frontCardDecoration: null,
                                  backCardDecoration: null,
                                );

                            ),
                          );
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildCreditCard(color: Colors.blue),
                          _buildCreditCard(color: Colors.red),
                          _buildCreditCard(color: Colors.green),
                          _buildCreditCard(color: Colors.yellow),
                          _buildCreditCard(color: Colors.orange),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCard({required Color color}) {
    return Container(
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
    );
  }
}
