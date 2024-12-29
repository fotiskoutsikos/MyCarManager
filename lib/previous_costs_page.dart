import 'package:flutter/material.dart';

class PreviousCostsPage extends StatelessWidget {
  const PreviousCostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Λευκό theme
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Previous Costs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Λογότυπο
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/car_logo.png'), // Βάλε την εικόνα σου
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(height: 20),

          // Τίτλος "Previous Costs"
          const Text(
            'Previous Costs',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Λίστα κόστους
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                buildCostItem(
                    'Oil Change', 'at 124.059km', '\$30', Icons.directions_car),
                buildCostItem('Windshield Wipers', 'at 109.360km', '\$25.50',
                    Icons.directions_car),
                buildCostItem(
                    'Multipliers Change', 'at 101.728km', '\$250', Icons.build),
                buildCostItem(
                    'New Tires', 'at 92.665km', '\$310', Icons.settings),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCostItem(String title, String subtitle, String cost, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[200], // Απαλό γκρι για το card
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple, size: 30),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.attach_money, color: Colors.green),
            Text(
              cost,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
