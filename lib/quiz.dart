import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];

  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.length;
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);
    if (_activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen();
    }

    if (_activeScreen == 'result-screen') {
      screenWidget = ResultsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(164, 255, 164, 1),
                Color.fromRGBO(255, 255, 164, 1),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
