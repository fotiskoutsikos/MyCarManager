import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Φωτογραφία προφίλ και όνομα
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_pic.png'), // Εικόνα προφίλ
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Λίστα επιλογών
            Expanded(
              child: ListView(
                children: [
                  buildSettingsOption(
                    icon: Icons.edit,
                    title: 'Edit Profile',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.music_note,
                    title: 'Sounds',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.vibration,
                    title: 'Vibrations',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.privacy_tip,
                    title: 'Privacy',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.storage,
                    title: 'Data & Storage',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.color_lens,
                    title: 'Change Theme',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.quiz,
                    title: 'Retake the Quiz',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.support,
                    title: 'Support',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.group,
                    title: 'Invite Your Friends',
                    context: context,
                  ),
                  buildSettingsOption(
                    icon: Icons.logout,
                    title: 'Sign Out',
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsOption(
      {required IconData icon, required String title, required BuildContext context}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.pink),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Προσθήκη λογικής για κάθε επιλογή αν χρειάζεται
        },
      ),
    );
  }
}
