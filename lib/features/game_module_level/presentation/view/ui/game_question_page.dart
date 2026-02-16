import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module_level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart';

class GameQuestionPage extends StatefulWidget {
  @override
  State<GameQuestionPage> createState() => _GameQuestionPageState();
}

class _GameQuestionPageState extends State<GameQuestionPage> {
  String? _selectedStringAnswer;
  bool? _selectedBoolAnswer;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameModuleLevelBloc>().state;
    if (state is! ReceiveSuccess) return const SizedBox.shrink();
    final isAnswered = state.isAnswered;
    final isAnswerInProgress = state is AnswerInProgress;
    final currentQuestion = state.questions[state.currentIndex];
    final hasSelectedAnswer = _selectedStringAnswer != null || _selectedBoolAnswer != null;
final selectedAnswer = _selectedStringAnswer ?? _selectedBoolAnswer;
    return Scaffold(
      appBar: AppBar(title: Text('Уровень ${currentQuestion.levelId}')),
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            child: Row(
              children: [
                Image.asset('assets/characters/orange.png'),
                Container(
                  width: 240,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    currentQuestion.question,
                    style: TextStyle(fontSize: 17, color: AppColors.blue),
                  ),
                ),
              ],
            ),
          ),
          _buildAnswer(
            currentQuestion,
            onAnswerSelected: (answer) {
              setState(() {
                if (currentQuestion.questionType == QuestionType.trueFalse) {
                  _selectedBoolAnswer = answer as bool;
                } else {
                  _selectedStringAnswer = answer as String;
                }
              });
            },
          ),
          
          _buildButton(
            context,
            isAnswerInProgress,
            hasSelectedAnswer,
            currentQuestion.questionType,
            selectedAnswer,
          ),
        ],
      ),
    );
  }
}

void _handleAnswer(BuildContext context, QuestionType type, dynamic answer) {
  switch (type) {
    case QuestionType.multipleChoice:
      context.read<GameModuleLevelBloc>().add(
        GameModuleLevelEvent.answerMultipleChoice(answer: answer as String),
      );
    case QuestionType.trueFalse:
      context.read<GameModuleLevelBloc>().add(
        GameModuleLevelEvent.answerTrueFalse(answer: answer as bool),
      );
    case QuestionType.fillBlank:
      context.read<GameModuleLevelBloc>().add(
        GameModuleLevelEvent.answerFillBlank(answer: answer as String),
      );
  }
}

Widget _buildButton(
  BuildContext context,
  bool isAnswerInProgress,
  bool hasSelectedAnswer,
  QuestionType currentQuestionType,
  selectedAnswer,
) {
  return ElevatedButton(
    onPressed: () {
      if (isAnswerInProgress) {
        context.read<GameModuleLevelBloc>()
          ..add(GameModuleLevelEvent.nextQuestion());
      } else {
        switch (currentQuestionType) {
          case QuestionType.multipleChoice:
            context.read<GameModuleLevelBloc>().add(
              GameModuleLevelEvent.answerMultipleChoice(answer: selectedAnswer),
            );
          case QuestionType.trueFalse:
            final boolAnswer = selectedAnswer == 'true';
            context.read<GameModuleLevelBloc>().add(
              GameModuleLevelEvent.answerTrueFalse(answer: boolAnswer),
            );
          case QuestionType.fillBlank:
            context.read<GameModuleLevelBloc>().add(
              GameModuleLevelEvent.answerFillBlank(answer: selectedAnswer),
            );
        }
      }
      ;
    },

    child: Text(isAnswerInProgress ? 'Далее' : 'Готово'),
  );
}

Widget _buildAnswer(
  GameModuleQuestionEntity question, {
  required Function(dynamic) onAnswerSelected,
}) {
  switch (question.questionType) {
    case QuestionType.multipleChoice:
      return MultipleChoiceWidget(
        question: question,
        onAnswerSelected: onAnswerSelected,
      );
    case QuestionType.trueFalse:
      return TrueFalseWidget(
        question: question,
        onAnswerSelected: onAnswerSelected,
      );
    case QuestionType.fillBlank:
      return FillBlankWidget(
        question: question,
        onAnswerSelected: onAnswerSelected,
      );
  }
}

class MultipleChoiceWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final Function(dynamic) onAnswerSelected;
  const MultipleChoiceWidget({
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.answers.map((answer) {
        return ListTile(
          title: Text(answer),
          onTap: () {
            onAnswerSelected(answer);
          },
        );
      }).toList(),
    );
  }
}

class TrueFalseWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final Function(dynamic) onAnswerSelected;
  const TrueFalseWidget({
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.answers.map((answer) {
        return ListTile(
          title: Text(answer),
          onTap: () {
            final boolAnswer = answer.toLowerCase() == 'true';
            onAnswerSelected(boolAnswer);
          },
        );
      }).toList(),
    );
  }
}

class FillBlankWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final Function(dynamic) onAnswerSelected;
  const FillBlankWidget({required this.question, required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.answers.map((answer) {
        return ListTile(
          title: Text(answer),
          onTap: () {
            onAnswerSelected(answer);
          },
        );
      }).toList(),
    );
  }
}
