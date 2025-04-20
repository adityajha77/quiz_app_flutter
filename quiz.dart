import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'question_screen.dart';
import 'questions.dart';
import 'result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;
  int score = 0;
  String activeScreen = 'start';

  List<Map<String, String>> summary = [];

  void switchToQuestions() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      summary = [];
      activeScreen = 'questions';
    });
  }

  void showNextQuestion(String selectedAnswer) {
    final currentQuestion = questions[currentQuestionIndex];
    final correctAnswer = currentQuestion.answers[0]; // assuming first is correct

    if (selectedAnswer == correctAnswer) {
      score++;
    }

    summary.add({
      'question': currentQuestion.text,
      'selected': selectedAnswer,
      'correct': correctAnswer,
    });

    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex < questions.length) {
        activeScreen = 'questions';
      } else {
        activeScreen = 'results';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (activeScreen == 'start') {
      screenWidget = StartScreen(switchToQuestions);
    } else if (activeScreen == 'questions') {
      screenWidget = QuestionScreen(
        question: questions[currentQuestionIndex],
        onSelectAnswer: showNextQuestion,
      );
    } else {
      screenWidget = ResultScreen(
        score: score,
        total: questions.length,
        onRestart: switchToQuestions,
        summary: summary,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
