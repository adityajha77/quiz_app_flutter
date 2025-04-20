import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;
  final List<Map<String, String>> summary;

  const ResultScreen({
    required this.score,
    required this.total,
    required this.onRestart,
    required this.summary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[50],
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'You scored $score out of $total',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ...summary.map((entry) {
              final isCorrect = entry['selected'] == entry['correct'];
              return Card(
                color: isCorrect ? Colors.green[100] : Colors.red[100],
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(entry['question'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Answer: ${entry['selected']}'),
                      Text('Correct Answer: ${entry['correct']}'),
                    ],
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
