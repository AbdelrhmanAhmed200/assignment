import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/login_page.dart';
import 'package:flutter_application_1/Controllers/Sign_Up_Controller.dart';
import 'package:flutter_application_1/Models/Sign_Up_Model.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  width: 70,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage("images/visa.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: "First Name"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: "Last Name"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email Address"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_confirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSignUpPressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 53, 72, 239),
                  ),
                  child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset('images/icons/google.png', fit: BoxFit.contain),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset('images/icons/facebook.png', fit: BoxFit.contain),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 18),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          },
                      ),
                      
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35,),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUpPressed() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Validation for fields that should not start or end with space
    if (firstName.isEmpty || lastName.isEmpty || username.isEmpty) {
      Get.snackbar('error', 'First Name, Last Name, and Username cannot be empty');
      return;
    }

    if (_firstNameController.text != firstName ||
        _lastNameController.text != lastName ||
        _usernameController.text != username) {
      Get.snackbar('error', 'Fields cannot start or end with spaces');
      return;
    }

    // Email format validation using regex
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      Get.snackbar('error', 'Invalid email format');
      return;
    }

    // Password length validation
    if (password.length < 8) {
     Get.snackbar('error', 'Password must be at least 8 characters long');
      return;
    }

    // Passwords match validation
    if (password != confirmPassword) {
      
        Get.snackbar('error', 'Passwords do not match');
      
      return;
    }
        SignUpController controller =Get.put(SignUpController());
    // Proceed with sign-up if all validations pass
    final user = User(
      firstName: firstName,
      lastName: lastName,
      username: username,
      email: email,
      password: password,
    );

   controller.signUp(user);
    Get.offAllNamed('/login');
  }
}
