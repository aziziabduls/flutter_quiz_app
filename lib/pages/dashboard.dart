import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/result_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController controller = PageController(initialPage: 0);
  List<Question> questions = [];
  bool selectedAnswer = false;
  int score = 0;
  int questionIndex = -1;
  int selectedIndex = -1;

  // Function
  Future<void> loadQuestions() async {
    var jsonString = await rootBundle.loadString('assets/question.json');
    List<dynamic> jsonMap = json.decode(jsonString);

    setState(() {
      questions = jsonMap.map((json) => Question.fromJson(json)).toList();
    });
  }

  // initState
  @override
  void initState() {
    loadQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz App'),
        centerTitle: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...questions.asMap().entries.map((e) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      e.value.question,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  answerWidget(e),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  answerWidget(MapEntry<int, Question> e) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: e.value.options.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: ListTile(
            title: Text(e.value.options[index].toString()),
            trailing: Icon(
              CupertinoIcons.check_mark_circled,
              color: e.value.correctIndex == selectedIndex ? Colors.white : Colors.transparent,
            ),
            onTap: () {
              int selected = e.value.options.indexOf(e.value.options[index]);
              if (e.value.correctIndex == selected) {
                score++;
              }
              questionIndex++;

              setState(() {});

              if (e.key == questions.length - 1) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        question: questions.length,
                        score: score,
                      ),
                    ),
                    (route) => false);
              } else {
                controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        );
      },
    );
  }
}
