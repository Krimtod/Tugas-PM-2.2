import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Bayar Kosan', '-Rp375.000', 'Food'),
      TransactionModel('Ongkos PP', '-Rp80.000', 'Travel'),
      TransactionModel('Top Up Game', '-Rp150.000', 'Health'),
      TransactionModel('Jajanin Ayang', '-Rp95.000', 'Event'),
      TransactionModel('Jual Akun Game', '+Rp100.000', 'Income'),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Finance Mate",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 158, 0, 124),
            shadows: [
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 20,
                color: Colors.cyanAccent,
              ),
            ],
          ),
        ),
      ),

      // ✅ GRADIENT BACKGROUND + GLASS EFFECT
      body: Stack(
        children: [
          // ===== Gradient Background =====
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue.withOpacity(0.35),
                  Colors.deepPurple.withOpacity(0.35),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),

          // ===== Glass Blur Layer =====
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.05),
                  Colors.white.withOpacity(0.02),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // ===== Main Content =====
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Cards',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 12),

                // ===== Banner Cards =====
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AtmCard(
                        bankName: 'Bank A',
                        cardNumber: '**** 2345',
                        balance: 'Rp12.500.000',
                        color1: Color.fromARGB(255, 97, 15, 240),
                        color2: Color.fromARGB(255, 217, 255, 0),
                      ),
                      AtmCard(
                        bankName: 'Bank B',
                        cardNumber: '**** 8765',
                        balance: 'Rp5.350.000',
                        color1: Color.fromARGB(255, 0, 217, 255),
                        color2: Color.fromARGB(255, 255, 35, 35),
                      ),
                      AtmCard(
                        bankName: 'Bank C',
                        cardNumber: '**** 1122',
                        balance: 'Rp25.750.000',
                        color1: Color.fromARGB(255, 255, 177, 8),
                        color2: Colors.teal,
                      ),
                      AtmCard(
                        bankName: 'Bank D',
                        cardNumber: '**** 9988',
                        balance: 'Rp3.150.000',
                        color1: Color.fromARGB(255, 34, 0, 129),
                        color2: Color.fromARGB(255, 44, 204, 71),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ===== Grid Menu =====
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  physics: NeverScrollableScrollPhysics(),
                  children: const [
                    GridMenuItem(
                      label: 'Health',
                      imagePath: 'assets/images/health.png',
                    ),
                    GridMenuItem(
                      label: 'Travel',
                      imagePath: 'assets/images/travel.png',
                    ),
                    GridMenuItem(
                      label: 'Food',
                      imagePath: 'assets/images/food.png',
                    ),
                    GridMenuItem(
                      label: 'Event',
                      imagePath: 'assets/images/event.png',
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                const Text(
                  'Recent Transactions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(transaction: transactions[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
