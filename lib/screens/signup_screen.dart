import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/images/eduhub_logo.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Sign up to continue using the app'),
                  const SizedBox(height: 20),
                  // Email TextFormField
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password TextFormField
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      autocorrect: false,
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Forgot Password text aligned to the right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: const Text(
                          'Forgot Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Login Button
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blue,
                      ),
                      foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                      minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('Signing you in...'),
                            ),
                          );
                          // Login user
                          final String email = _emailController.text.trim();
                          final String password = _passwordController.text;

                          await _auth.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                          // redirect after successful signup
                          if (_auth.currentUser != null) {
                            Navigator.of(context).pushReplacementNamed('/home');
                          }
                          // await supabase.auth.signInWithPassword(
                          //   email: email,
                          //   password: password,
                          // );
                          // if (mounted) {
                          //   Navigator.of(context).pushReplacement(
                          //     MaterialPageRoute(
                          //       builder: (context) => const HomeScreen(),
                          //     ),
                          //   );
                          // }

                          // Navigate to HomeScreen on successful login
                        } on Exception catch (e) {
                          print(e);
                          // TODO
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 10),
                              content: Text(e.toString()),
                            ),
                          );
                        }
                        // Clear text in TextEditingControllers after login
                        _emailController.clear();
                        _passwordController.clear();
                      }
                    },
                    child: const Text('Sign up'),
                  ),
                  const SizedBox(height: 20),
                  // Already have an account? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}