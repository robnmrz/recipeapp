import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  bool _isObscure = true;

  // [userLogin] function
  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    final response =
        await client.auth.signInWithPassword(email: email, password: password);
    final user = response.user;
    return user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            const Icon(Icons.sailing_rounded, size: 150, color: Colors.blue),
            largeGap,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  hintText: "Enter your email",
                ),
              ),
            ),
            smallGap,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
            ),
            largeGap,

            isLoading
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic loginValue = await userLogin(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      setState(() {
                        isLoading = false;
                      });

                      if (!context.mounted) return;

                      if (loginValue != null) {
                        Navigator.pushReplacementNamed(context, '/apppage');
                      } else {
                        context.showErrorMessage('Invalid email or password');
                      }
                    },
                    child: const Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
