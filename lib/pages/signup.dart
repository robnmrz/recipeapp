import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  Future<bool?> createUser({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signUp(email: email, password: password);
    final user = response.user;
    if (user != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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

            OutlinedButton(
                onPressed: () async {
                  final userValue = await createUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (!context.mounted) return;

                  if (userValue == true) {
                    Navigator.pushReplacementNamed(context, '/signin');
                    context
                        .showErrorMessage('Success: Please check your email');
                  } else {
                    context.showErrorMessage('Something went wrong');
                  }
                },
                child: const Text('Sign Up')),
          ],
        ),
      ),
    );
    // return Column(
    //   children: [
    //     TextField(
    //       controller: emailController,
    //     ),
    //     TextField(
    //       controller: passwordController,
    //       obscureText: true,
    //     ),
    //     MaterialButton(
    //         onPressed: () async {
    //           final sm = ScaffoldMessenger.of(context);
    //           final authResponse = await supabase.auth.signUp(
    //               password: passwordController.text,
    //               email: emailController.text);

    //           sm.showSnackBar(SnackBar(
    //             content: Text("Logged in as ${authResponse.user!.email}"),
    //           ));
    //         },
    //         child: const Text('Sign Up')),
    //   ],
    // );
  }
}
