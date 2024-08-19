import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// supabase client
final client = Supabase.instance.client;

// small gap
const smallGap = SizedBox(height: 15);

// large gap
const largeGap = SizedBox(height: 30);

// custom SnackBar
extension ShowSnackBar on BuildContext {
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
