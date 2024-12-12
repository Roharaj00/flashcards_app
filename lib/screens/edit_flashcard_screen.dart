import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../services/flashcard_service.dart';
import '../widgets/flashcard_form.dart';

class EditFlashcardScreen extends StatelessWidget {
  final Flashcard flashcard;
  final FlashcardService flashcardService;

  const EditFlashcardScreen({
    super.key,
    required this.flashcard,
    required this.flashcardService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Flashcard'),
      ),
      body: FlashcardForm(
        flashcardService: flashcardService,
        initialQuestion: flashcard.question,
        initialAnswer: flashcard.answer,
        onSubmit: (question, answer) async {
          await flashcardService.updateFlashcard(
            flashcard.id,
            question,
            answer,
          );
          Navigator.pop(context);
        },
      ),
    );
  }
}