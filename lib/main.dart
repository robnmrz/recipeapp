import 'package:flutter/material.dart';
import 'package:recipe_app/pages/app_page.dart';
import 'package:recipe_app/pages/home.dart';
import 'package:recipe_app/pages/signin.dart';
import 'package:recipe_app/pages/signup.dart';
import 'package:recipe_app/secrets.dart';
import 'package:recipe_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supaBaseUrl,
    anonKey: supaBaseKey,
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  home: BottomNavBar(),
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      initialRoute: client.auth.currentSession != null ? 'appapge' : '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => const SignUp(),
        '/signin': (context) => const SignIn(),
        '/apppage': (context) => const AppPage(),
      },
      // home: supabase.auth.currentSession == null
      //     ? const LoginPage()
      //     : const AccountPage(),
    );
  }
}

// extension ContextExtension on BuildContext {
//   void showSnackBar(String message, {bool isError = false}) {
//     ScaffoldMessenger.of(this).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isError
//             ? Theme.of(this).colorScheme.error
//             : Theme.of(this).snackBarTheme.backgroundColor,
//       ),
//     );
//   }
// }
