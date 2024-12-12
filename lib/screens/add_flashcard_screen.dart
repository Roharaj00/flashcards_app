import 'package:flutter/material.dart';
import '../services/flashcard_service.dart';
import '../widgets/flashcard_form.dart';

class AddFlashcardScreen extends StatelessWidget {
  final FlashcardService flashcardService;

  const AddFlashcardScreen({
    super.key,
    required this.flashcardService,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Flashcard'),
      ),
      backgroundColor: const Color.fromARGB(255, 32, 51, 61),
      body: FlashcardForm(
        flashcardService: flashcardService,
        onSubmit: (question, answer) async {
          await flashcardService.addFlashcard(question, answer);
          Navigator.pop(context);
        },
      ),
    );
  }
}