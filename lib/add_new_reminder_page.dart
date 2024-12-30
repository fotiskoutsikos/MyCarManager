import 'package:flutter/material.dart';

class AddNewReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Reminder'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title:',
                hintText: 'e.g. Go to Auto Repair Shop',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Service', child: Text('Service')),
                DropdownMenuItem(value: 'Insurance', child: Text('Insurance Renewal')),
                DropdownMenuItem(value: 'KTEO', child: Text('Inspection (KTEO)')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Type:'),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Date and Time:',
                hintText: 'DD/MM/YYYY HH:MM',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Notes:',
                hintText: 'e.g. Remember to ask the mechanic',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Λογική αποθήκευσης
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('ADD NEW REMINDER'),
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
