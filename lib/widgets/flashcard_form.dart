import 'package:flutter/material.dart';
import '../services/flashcard_service.dart';
import '../utils/validation_utils.dart';
import 'forms/text_input_field.dart';

class FlashcardForm extends StatefulWidget {
  final FlashcardService flashcardService;
  final String? initialQuestion;
  final String? initialAnswer;
  final Future<void> Function(String question, String answer) onSubmit;

  const FlashcardForm({
    super.key,
    required this.flashcardService,
    this.initialQuestion,
    this.initialAnswer,
    required this.onSubmit,
  });

  @override
  State<FlashcardForm> createState() => _FlashcardFormState();
}

class _FlashcardFormState extends State<FlashcardForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _questionController;
  late TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget.initialQuestion);
    _answerController = TextEditingController(text: widget.initialAnswer);
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextInputField(
  
              
              controller: _questionController,
              label: 'Question',
              validator: (value) => ValidationUtils.validateRequired(value, 'question'),
            ),
            const SizedBox(height: 16),
            TextInputField(
              controller: _answerController,
              label: 'Answer',
              validator: (value) => ValidationUtils.validateRequired(value, 'answer'),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit(
                    _questionController.text,
                    _answerController.text,
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}