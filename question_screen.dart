import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'questions.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final void Function(String) onSelectAnswer;

  const QuestionScreen({
    required this.question,
    required this.onSelectAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shuffledAnswers = question.getShuffledAnswers(); // 🎯

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Quiz Question'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.text,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[900],
              ),
            ),
            const SizedBox(height: 30),
            ...shuffledAnswers.map((answer) {
              return ElevatedButton(
                onPressed: () => onSelectAnswer(answer),
                child: Text(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
