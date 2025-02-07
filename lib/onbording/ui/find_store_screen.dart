import 'package:flutter/material.dart';

class FindStoreScreen extends StatelessWidget {
  const FindStoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SafeArea(
        child: Center( // Wrap everything in a Center widget to center the content
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/dress.png',
                  height: 300,
                  width: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Image not found!');
                  },
                ),
                const SizedBox(height: 40),
                const Text(
                  'Hey! My Girl ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Explore the latest designs and styles for every occasion\n Shop effortlessly with secure payments and fast delivery!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40), // Add spacing before the button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to sign in screen
                    Navigator.pushNamed(context, '/signin');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 242, 132, 130),
                    minimumSize: const Size(200, 50), // Set specific width and height here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Lets Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
