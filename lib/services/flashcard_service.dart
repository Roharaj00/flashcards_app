import 'dart:async';
import '../models/flashcard.dart';

class FlashcardService {
  final List<Flashcard> _flashcards = [];
  final _flashcardsController = StreamController<List<Flashcard>>.broadcast();

  Stream<List<Flashcard>> get flashcardsStream => _flashcardsController.stream;

  FlashcardService() {
    _flashcardsController.add(_flashcards);
  }

  Future<void> addFlashcard(String question, String answer) async {
    final flashcard = Flashcard(
      id: DateTime.now().toString(),
      question: question,
      answer: answer,
    );
    _flashcards.add(flashcard);
    _flashcardsController.add(_flashcards);
  }

  Future<void> updateFlashcard(
    String id,
    String question,
    String answer,
  ) async {
    final index = _flashcards.indexWhere((f) => f.id == id);
    if (index != -1) {
      _flashcards[index] = Flashcard(
        id: id,
        question: question,
        answer: answer,
      );
      _flashcardsController.add(_flashcards);
    }
  }

  Future<void> deleteFlashcard(String id) async {
    _flashcards.removeWhere((f) => f.id == id);
    _flashcardsController.add(_flashcards);
  }

  void dispose() {
    _flashcardsController.close();
  }
}