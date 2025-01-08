import 'package:flutter/material.dart';
import 'data.dart'; // Εισαγωγή της λίστας reminders

class AddNewReminderPage extends StatefulWidget {
  const AddNewReminderPage({super.key});

  @override
  _AddNewReminderPageState createState() => _AddNewReminderPageState();
}

class _AddNewReminderPageState extends State<AddNewReminderPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? _selectedType;

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
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title:',
                hintText: 'e.g. Go to Auto Repair Shop',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Service', child: Text('Service')),
                DropdownMenuItem(
                    value: 'Insurance', child: Text('Insurance Renewal')),
                DropdownMenuItem(value: 'KTEO', child: Text('Inspection (KTEO)')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Type:'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Date and Time:',
                hintText: 'DD/MM/YYYY HH:MM',
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes:',
                hintText: 'e.g. Remember to ask the mechanic',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _selectedType != null &&
                    _dateController.text.isNotEmpty) {
                  // Προσθήκη νέου reminder στη λίστα
                  reminders.add({
                    'title': _titleController.text,
                    'type': _selectedType,
                    'date': _dateController.text,
                    'notes': _notesController.text,
                  });

                  // Προσθήκη δόνησης για feedback
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
