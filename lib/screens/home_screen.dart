import 'package:flutter/material.dart';
import '../widgets/flashcard_list.dart';
import '../widgets/add_flashcard_button.dart';
import '../services/flashcard_service.dart';
import '../widgets/app_bar/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlashcardService _flashcardService = FlashcardService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 51, 61),
      
      appBar: const CustomAppBar(title: 'Flashcards'),
      body: FlashcardList(
        flashcardService: _flashcardService,
      ),
      floatingActionButton: AddFlashcardButton(
        flashcardService: _flashcardService,
      ),
    );
  }

  @override
  void dispose() {
    _flashcardService.dispose();
    super.dispose();
  }
}