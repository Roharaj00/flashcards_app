import 'package:flutter/material.dart';
import '../../models/flashcard.dart';
import '../../services/flashcard_service.dart';
import '../../screens/edit_flashcard_screen.dart';
import '../../utils/navigation_utils.dart';
import '../dialogs/confirmation_dialog.dart';

class FlashcardActions extends StatelessWidget {
  final Flashcard flashcard;
  final FlashcardService flashcardService;

  const FlashcardActions({
    super.key,
    required this.flashcard,
    required this.flashcardService,
  });

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await ConfirmationDialog.show(
      context,
      title: 'Delete Flashcard',
      content: 'Are you sure you want to delete this flashcard?',
      confirmText: 'Delete',
    );

    if (confirmed == true) {
      flashcardService.deleteFlashcard(flashcard.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            NavigationUtils.pushScreen(
              context,
              EditFlashcardScreen(
                flashcard: flashcard,
                flashcardService: flashcardService,
              ),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => _confirmDelete(context),
        ),
      ],
    );
  }
}