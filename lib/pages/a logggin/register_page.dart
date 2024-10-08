
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _isPasswordVisible = false;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //Create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Add user details
  
    }
  
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png', // Path to your image
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      height: 200,
                      width: 200,
                      'assets/images/uplift_logo.png',
                    ),
                    const Text(
                      "Join us now!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 73, 84, 145),
                      ),
                    ),
                    const SizedBox(height: 30),
          
                    
                    //Email textfield
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 111, 128, 222),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email Address',
                                
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.email, color:  Color.fromARGB(255, 111, 128, 222),), // Added icon
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        //Password textfield with show/hide functionality
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 111, 128, 222),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible, // Toggle based on visibility
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                prefixIcon: const Icon(Icons.lock, color:  Color.fromARGB(255, 111, 128, 222),), // Added icon
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off, color: const Color.fromARGB(255, 111, 128, 222),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                  
          
                    //Confirm password textfield
                    Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 111, 128, 222),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextField(
                              controller: _confirmpasswordController,
                              obscureText: !_isPasswordVisible, // Toggle based on visibility
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                border: InputBorder.none,
                                prefixIcon: const Icon(Icons.lock, color:  Color.fromARGB(255, 111, 128, 222),), // Added icon
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off, color: const Color.fromARGB(255, 111, 128, 222),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                    const SizedBox(height: 12),
                    //Sign In button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 111, 222, 205),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                              child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Not a member? Join now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already a member?'),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 111, 128, 222), fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}