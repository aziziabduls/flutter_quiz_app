import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/dashboard.dart';
import 'package:quiz_app/pages/welcome_pages.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.question,
    required this.score,
  });

  final int question;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Score',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / question,
                    color: Colors.green,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                  ),
                ),
                Column(
                  children: [
                    // Text(
                    //   '$score',
                    //   style: const TextStyle(fontSize: 80),
                    // ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: score.toString(),
                            style: TextStyle(
                              fontSize: 80,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: '/ $question',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${(score / question * 100).round()}%',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 70),
            CupertinoButton(
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
              child: const Text('Retry'),
            ),
            const SizedBox(height: 30),
            CupertinoButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ),
                    (route) => false);
              },
              child: const Text('Go to Welcome Page'),
            ),
          ],
        ),
      ),
    );
  }
}
