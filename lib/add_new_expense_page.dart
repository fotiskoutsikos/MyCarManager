import 'package:flutter/material.dart';

class AddNewExpensePage extends StatelessWidget {
  const AddNewExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Expense'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Fuel', child: Text('Fuel')),
                DropdownMenuItem(value: 'Service', child: Text('Service')),
                DropdownMenuItem(value: 'Other', child: Text('Other')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Expense Type:'),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Expense Description:',
                hintText: 'e.g. Fuel Refill',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount:',
                hintText: 'e.g. 500\$',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Date:',
                hintText: 'DD/MM/YYYY',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Λογική αποθήκευσης
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text('ADD NEW EXPENSE'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
