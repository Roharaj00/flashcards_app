import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../services/flashcard_service.dart';
import 'flashcard_item.dart';
import '../constants/app_constants.dart';

class FlashcardList extends StatelessWidget {
  final FlashcardService flashcardService;

  const FlashcardList({
    super.key,
    required this.flashcardService,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Flashcard>>(
      stream: flashcardService.flashcardsStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("Add Flashcard",
          style: TextStyle(color: Colors.white),
          ));
        }

        final flashcards = snapshot.data!;
        
        if (flashcards.isEmpty) {
          return const Center(
            child: Text(AppConstants.noFlashcardsMessage),
          );
        }

        return ListView.builder(
          itemCount: flashcards.length,
          itemBuilder: (context, index) {
            return FlashcardItem(
              flashcard: flashcards[index],
              flashcardService: flashcardService,
            );
          },
        );
      },
    );
  }
}