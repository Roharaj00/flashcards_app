import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../services/flashcard_service.dart';
import 'animations/flip_animation.dart';
import 'flashcard/flashcard_content.dart';
import 'flashcard/flashcard_actions.dart';

class FlashcardItem extends StatefulWidget {
  final Flashcard flashcard;
  final FlashcardService flashcardService;

  const FlashcardItem({
    super.key,
    required this.flashcard,
    required this.flashcardService,
  });

  @override
  State<FlashcardItem> createState() => _FlashcardItemState();
}

class _FlashcardItemState extends State<FlashcardItem> {
  bool _showAnswer = false;

  void _toggleAnswer() {
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _toggleAnswer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              FlipAnimation(
                showBack: _showAnswer,
                front: FlashcardContent(
                  flashcard: widget.flashcard,
                  showAnswer: false,
                ),
                back: FlashcardContent(
                  flashcard: widget.flashcard,
                  showAnswer: true,
                ),
              ),
              const SizedBox(height: 16),
              FlashcardActions(
                flashcard: widget.flashcard,
                flashcardService: widget.flashcardService,
              ),
            ],
          ),
        ),
      ),
    );
  }
}