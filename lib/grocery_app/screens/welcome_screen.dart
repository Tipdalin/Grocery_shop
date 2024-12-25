import 'package:flutter/material.dart';
import 'item_list_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 57, 243),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/logo.png'), // Add your image asset
          const SizedBox(height: 20),
          const Text(
            "Shop your Daily Necessary",
            style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text("Fresh items everyday", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ItemListScreen()));
            },
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.white),
            child: const Text("Get Started"),
          ),
        ],
      ),
    );
  }
}
