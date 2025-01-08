import 'package:flutter/material.dart';
import 'data.dart'; // Εισαγωγή της κοινής λίστας για τα έξοδα

class AddNewExpensePage extends StatefulWidget {
  const AddNewExpensePage({super.key});

  @override
  _AddNewExpensePageState createState() => _AddNewExpensePageState();
}

class _AddNewExpensePageState extends State<AddNewExpensePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? _selectedType;

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
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Expense Type:'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Expense Description:',
                hintText: 'e.g. Fuel Refill',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Amount:',
                hintText: 'e.g. 500\$',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Date:',
                hintText: 'DD/MM/YYYY',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_selectedType != null &&
                    _descriptionController.text.isNotEmpty &&
                    _amountController.text.isNotEmpty &&
                    _dateController.text.isNotEmpty) {
                  // Προσθήκη νέου εξόδου στη λίστα
                  expenses.add({
                    'type': _selectedType,
                    'description': _descriptionController.text,
                    'amount': _amountController.text,
                    'date': _dateController.text,
                  });

                   HapticFeedback.vibrate();

                  // Επιστροφή στην προηγούμενη σελίδα
                  Navigator.pop(context);
                } else {
                  // Ειδοποίηση αν λείπουν δεδομένα
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
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
