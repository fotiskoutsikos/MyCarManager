import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class AddNewCarPage extends StatelessWidget {
  const AddNewCarPage({super.key});

    triggerCarNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(id: 10, channelKey: 'basic_channel', title: 'Check out MyCarManager', body: 'Enjoy your new car!')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Car'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Car Brand:',
                hintText: 'e.g. Volkswagen, Hyundai',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Car Model:',
                hintText: 'e.g. Polo, Yaris',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Year:',
                hintText: 'e.g. 2024',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Distance Covered (km):',
                hintText: 'e.g. 500',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Λογική αποθήκευσης
                Navigator.pop(context);
                triggerCarNotification();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('ADD NEW CAR'),
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
