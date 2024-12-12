import 'package:flutter/material.dart';
import '../screens/add_flashcard_screen.dart';
import '../services/flashcard_service.dart';

class AddFlashcardButton extends StatelessWidget {
  final FlashcardService flashcardService;

  const AddFlashcardButton({
    super.key,
    required this.flashcardService,
  });

  @override
  Widget build(BuildContext context) {
    return 
      FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFlashcardScreen(
                flashcardService: flashcardService,
              ),
            ),
          );
        },
     child:  Icon(Icons.add),
     );
  }
}