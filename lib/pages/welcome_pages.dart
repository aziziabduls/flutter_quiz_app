import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/dashboard.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 90,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: FlutterLogo(),
            ),
            SizedBox(width: 10),
            Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Welcome to Quiz App',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Incididunt ea nostrud dolor enim pariatur eu duis aute adipisicing Lorem enim amet. Proident cupidatat proident deserunt Lorem ad cillum irure dolor.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                      (route) => false);
                },
                child: const Text('Lets Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
