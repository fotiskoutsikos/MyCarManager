import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController fullNameController = TextEditingController();
  String profileImagePath = 'assets/profile_pic.png'; // Default εικόνα

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullNameController.text = prefs.getString('fullName') ?? '';
      profileImagePath = prefs.getString('profileImage') ?? 'assets/profile_pic.png';
    });
  }

  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullNameController.text);
    await prefs.setString('profileImage', profileImagePath);
  }

  void _changeProfileImage() async {
    final String? selectedImage = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choose Profile Picture'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'assets/profile_pic1.png'),
              child: Row(
                children: [
                  Image.asset('assets/profile_pic1.png', width: 50, height: 50),
                  const SizedBox(width: 10),
                  const Text('Option 1'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'assets/profile_pic2.png'),
              child: Row(
                children: [
                  Image.asset('assets/profile_pic2.png', width: 50, height: 50),
                  const SizedBox(width: 10),
                  const Text('Option 2'),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'assets/profile_pic3.png'),
              child: Row(
                children: [
                  Image.asset('assets/profile_pic3.png', width: 50, height: 50),
                  const SizedBox(width: 10),
                  const Text('Option 3'),
                ],
              ),
            ),
          ],
        );
      },
    );

    if (selectedImage != null) {
      setState(() {
        profileImagePath = selectedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Εικόνα προφίλ
            GestureDetector(
              onTap: _changeProfileImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profileImagePath),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tap to change profile picture',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Πλήρες όνομα
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Αποθήκευση αλλαγών
            ElevatedButton(
              onPressed: () async {
                await _saveProfileData();
                Navigator.pop(context, true); // Επιστροφή με επιτυχία
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Save Changes', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
