import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/auth/bloc/sign_in_bloc.dart';
import 'package:my_project/auth/bloc/sign_in_event.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/dress.png',
                height: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign in Your Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              // Use the custom _buildTextField
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'abc@gmail.com',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                hint: '••••••••••',
                isPassword: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    SignInRequested(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 242, 132, 130),
                  minimumSize: const Size(200, 50), // Set specific width and height here
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Colors.white), // Set the color to white
                ),
              ),
             
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color.fromARGB(255, 242, 132, 130)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  // Custom method for TextFields (email, password)
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 116, 109, 109)), // Set the label text color to gray
        hintText: hint,
        // Default border when not focused
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0), // Border color when not focused
          borderRadius: BorderRadius.circular(10),
        ),
        // Border color when focused
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 243, 168, 167), // Custom focused border color
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
