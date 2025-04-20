class Question {
  final String text;
  final List<String> answers;

  const Question(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shuffled = List.of(answers); // Make a copy so original stays untouched
    shuffled.shuffle(); // Shuffle in-place
    return shuffled;
  }
}

const questions = [
  Question(
    'What is the capital of France?',
    ['Paris', 'Berlin', 'Madrid', 'Rome'],
  ),
  Question(
    'Which planet is known as the Red Planet?',
    ['Mars', 'Earth', 'Venus', 'Jupiter'],
  ),
  Question(
    'Who wrote Hamlet?',
    ['Shakespeare', 'Dickens', 'Hemingway', 'Tolstoy'],
  ),
  Question(
    'Which gas do plants absorb from the atmosphere?',
    ['Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'],
  ),
  Question(
    'Which is the largest ocean in the world?',
    ['Pacific Ocean', 'Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean'],
  ),
  Question(
    'In what year did World War II end?',
    ['1945', '1939', '1940', '1950'],
  ),
  Question(
    'What is the smallest prime number?',
    ['2', '1', '0', '3'],
  ),
  Question(
    'Which part of the plant conducts photosynthesis?',
    ['Leaf', 'Root', 'Stem', 'Flower'],
  ),
  Question(
    'What is the chemical symbol for Gold?',
    ['Au', 'Ag', 'Gd', 'Go'],
  ),
  Question(
    'Who painted the Mona Lisa?',
    ['Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh', 'Michelangelo'],
  ),
];

