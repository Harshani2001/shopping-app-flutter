import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/auth/bloc/sign_up_bloc.dart';
import 'package:my_project/auth/bloc/sign_up_event.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isRememberMeChecked = false; // Track checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              const SizedBox(height: 40),
              const Text(
                'Create New Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                hint: '+00 000 000 000',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'abc@gmail.com',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _usernameController,
                label: 'User Name',
                hint: 'your name',
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                hint: '••••••••••',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _confirmPasswordController,
                label: 'Confirm Password',
                hint: '••••••••••',
                isPassword: true,
              ),

              const SizedBox(height: 20),
              // "Remember me" Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isRememberMeChecked, // Track the value
                    onChanged: (bool? value) {
                      setState(() {
                        _isRememberMeChecked = value ?? false; // Update state
                      });
                    },
                    activeColor: const Color.fromARGB(255, 242, 132, 130),
                  ),
                  const Text('Remember me'),
                ],
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  context.read<SignUpBloc>().add(
                    SignUpRequested(
                      email: _emailController.text,
                      password: _passwordController.text,
                      phone: _phoneController.text,
                      username: _usernameController.text,
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
                  style: TextStyle(color: Colors.white), 
                  // Set the color to white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

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
