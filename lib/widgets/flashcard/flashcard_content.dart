import 'package:flutter/material.dart';
import '../../models/flashcard.dart';

class FlashcardContent extends StatelessWidget {
  final Flashcard flashcard;
  final bool showAnswer;

  const FlashcardContent({
    super.key,
    required this.flashcard,
    required this.showAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          showAnswer ? 'Answer:' : 'Question:',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        Text(
          showAnswer ? flashcard.answer : flashcard.question,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}