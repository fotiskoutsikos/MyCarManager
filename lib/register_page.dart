import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key}); // Προστέθηκε const

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Επιλεγμένο φύλο
  String? selectedGender;

  // Επιλεγμένο age range
  String? selectedAgeRange;

  // Controllers για τα πεδία κειμένου
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Απαλό γκρι background
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Λογότυπο ή εικόνα
                Image.asset(
                  'assets/car_logo.png', // Διάλεξε το λογότυπο που θα χρησιμοποιήσεις
                  height: 100,
                ),
                const SizedBox(height: 20),

                // Full Name Field
                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Gender Selection
                const Text(
                  "Gender:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        const Text('Male'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Age Range Selection
                const Text(
                  "Age Range:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Wrap(
                  spacing: 10.0,
                  children: [
                    ChoiceChip(
                      label: const Text('18-25'),
                      selected: selectedAgeRange == '18-25',
                      onSelected: (selected) {
                        setState(() {
                          selectedAgeRange = '18-25';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('26-45'),
                      selected: selectedAgeRange == '26-45',
                      onSelected: (selected) {
                        setState(() {
                          selectedAgeRange = '26-45';
                        });
                      },
                    ),
                    ChoiceChip(
                      label: const Text('45+'),
                      selected: selectedAgeRange == '45+',
                      onSelected: (selected) {
                        setState(() {
                          selectedAgeRange = '45+';
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Username Field
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Set New Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    // Προσθήκη λογικής εγγραφής (π.χ., αποθήκευση τοπικά)
                    if (fullNameController.text.isNotEmpty &&
                        usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        selectedGender != null &&
                        selectedAgeRange != null) {
                      // Επιστροφή στη Login Page
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
