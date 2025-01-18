import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: const Color.fromARGB(255, 211, 196, 219),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 211, 196, 219),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 20),

            Text(
              'Quick Help',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                HelpChip(
                  icon: Icons.shopping_cart,
                  label: 'Orders',
                  onTap: () {
                    // Handle orders help
                  },
                ),
                HelpChip(
                  icon: Icons.payment,
                  label: 'Payments',
                  onTap: () {
                    // Handle payments help
                  },
                ),
                HelpChip(
                  icon: Icons.account_circle,
                  label: 'Account',
                  onTap: () {
                    // Handle account help
                  },
                ),
                HelpChip(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {
                    // Handle settings help
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // FAQ Section
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            FAQItem(
              question: 'How do I track my order?',
              answer:
                  'You can track your order from the "Orders" section in your account.',
            ),
            FAQItem(
              question: 'What payment methods are accepted?',
              answer:
                  'We accept credit/debit cards, PayPal, and other popular payment methods.',
            ),
            FAQItem(
              question: 'How can I return an item?',
              answer:
                  'You can initiate a return from the "Orders" section within 30 days of delivery.',
            ),
            SizedBox(height: 20),

            // Contact Support Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle contact support
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 220, 196, 194),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Contact Support',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for Help Chips
class HelpChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HelpChip({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.black),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget for FAQ Items
class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              answer,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
