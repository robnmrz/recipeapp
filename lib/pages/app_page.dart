import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Page'),
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  client.auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                icon: const Icon(Icons.logout),
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.sailing_rounded, size: 150, color: Colors.blue),
              smallGap,
              const Text(
                'Welcome',
                style: TextStyle(color: Colors.blue, fontSize: 50),
              ),
              smallGap,
              Text(
                'Hello ${client.auth.currentUser?.email}',
                style: const TextStyle(color: Colors.blue, fontSize: 15),
              ),
              largeGap
            ],
          ),
        ));
  }
}
