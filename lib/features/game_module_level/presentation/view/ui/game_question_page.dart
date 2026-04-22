import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module_level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module_level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class GameQuestionPage extends StatefulWidget {
  @override
  State<GameQuestionPage> createState() => _GameQuestionPageState();
}

class _GameQuestionPageState extends State<GameQuestionPage> {
  String? _selectedStringAnswer;
  bool? _selectedBoolAnswer;
  int? _lastQuestionId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.watch<GameModuleLevelBloc>().state;
    
    int? currentQuestionId;
    if (state is ReceiveSuccess) {
      currentQuestionId = state.questions[state.currentIndex].id;
    } else if (state is AnswerInProgress) {
      currentQuestionId = state.question.id;
    }
    
    if (_lastQuestionId != currentQuestionId) {
      _lastQuestionId = currentQuestionId;
      _selectedStringAnswer = null;
      _selectedBoolAnswer = null;
      print('Question changed to $currentQuestionId, answers reset');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameModuleLevelBloc>().state;
    if (state is! ReceiveSuccess && state is! AnswerInProgress) {
    return const SizedBox.shrink();
  }
  final currentQuestion = state is ReceiveSuccess 
      ? state.questions[state.currentIndex] 
      : (state is AnswerInProgress ? state.question : null);
    final isAnswered = state is ReceiveSuccess ? state.isAnswered : true;
    final isAnswerInProgress = state is AnswerInProgress;
    if (currentQuestion == null && !isAnswerInProgress) {
    return const SizedBox.shrink();

  }
  
    final hasSelectedAnswer =
        _selectedStringAnswer != null || _selectedBoolAnswer != null;
    final selectedAnswer = _selectedStringAnswer ?? _selectedBoolAnswer;
    return Scaffold(
      appBar: MainAppBar(title: currentQuestion?.levelId != null 
          ? 'Уровень ${currentQuestion!.levelId}' 
          : 'Объяснение'),
      body: Stack(
        children: [
          if (currentQuestion != null)
          Column(
            children: [
              SizedBox(height: 100),
              _buildQuestionHeader(currentQuestion),
              _buildAnswer(
                currentQuestion,
                onStringAnswerSelected: (answer) {
                  setState(() => _selectedStringAnswer = answer);
                },
                onBoolAnswerSelected: (answer) {
                  setState(() => _selectedBoolAnswer = answer);
                },
                selectedStringAnswer: _selectedStringAnswer,
                selectedBoolAnswer: _selectedBoolAnswer,
              ),

              _buildButton(
                context,
                isAnswerInProgress,
                hasSelectedAnswer,
                currentQuestion.questionType,
                selectedAnswer,
                isAnswered,
              ),
            ],
          ),
          if (isAnswerInProgress)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildExplantationOverlay(
                context,
                state,
              ),
            ),
        ],
      ),
    );
  }
}

Widget _buildQuestionHeader(GameModuleQuestionEntity question) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        // Аватар персонажа
        Image.asset(
          'assets/characters/orange.png',
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),

        // Текст вопроса
        Expanded(
          child: Text(
            question.question,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.blue,
              height: 1.4,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildExplantationOverlay(BuildContext context, AnswerInProgress state) {
  return Container(
    padding: EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(0, -5)),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          state.isCorrect ? Icons.check_circle : Icons.cancel,
          color: state.isCorrect ? Colors.green : Colors.red,
          size: 48,
        ),
        SizedBox(height: 16),
        Text(
          state.isCorrect ? 'Правильно!' : 'Неправильно',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: state.isCorrect ? Colors.green : Colors.red,
          ),
        ),
        SizedBox(height: 16),
        Text(state.explanation, textAlign: TextAlign.center),
        SizedBox(height: 16),
        Text(
          'Правильный ответ: ${state.correctAnswer}',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

void _handleAnswer(BuildContext context, QuestionType type, dynamic answer) {
  
  switch (type) {
    case QuestionType.multipleChoice:
      context.read<GameModuleLevelBloc>().add(
        GameModuleLevelEvent.answerMultipleChoice(answer: answer),
      );
    case QuestionType.trueFalse:
      context.read<GameModuleLevelBloc>().add(
        GameModuleLevelEvent.answerTrueFalse(answer: answer),
      );
    case QuestionType.fillBlank:
      context.read<GameModuleLevelBloc>().add(
        GameModuleLevelEvent.answerFillBlank(answer: answer),
      );
  }
}

Widget _buildButton(
  BuildContext context,
  bool isAnswerInProgress,
  bool hasSelectedAnswer,
  QuestionType currentQuestionType,
  selectedAnswer,
  isAnswered,
) {
  
  return ElevatedButton(
    onPressed: () {
      if (isAnswerInProgress) {
        // В состоянии объяснения - всегда можно нажать Далее
        context.read<GameModuleLevelBloc>().add(
          GameModuleLevelEvent.nextQuestion(),
        );
      } else {
        // В состоянии вопроса - можно нажать только если есть выбранный ответ и еще не отвечали
        if (hasSelectedAnswer && !isAnswered) {
          _handleAnswer(context, currentQuestionType, selectedAnswer);
          
        }
      }
    },
    child: Text(isAnswerInProgress ? 'Далее' : 'Готово'),
    
  );
  
}

Widget _buildAnswer(
  GameModuleQuestionEntity question, {
  required Function(String) onStringAnswerSelected,
  required Function(bool) onBoolAnswerSelected,
  required String? selectedStringAnswer,
  required bool? selectedBoolAnswer,
}) {
  switch (question.questionType) {
    case QuestionType.multipleChoice:
    case QuestionType.fillBlank:
      return MultipleChoiceWidget(
        question: question,
        selectedAnswer: selectedStringAnswer,
        onAnswerSelected: onStringAnswerSelected,
      );
    case QuestionType.trueFalse:
      return TrueFalseWidget(
        question: question,
        selectedAnswer: selectedBoolAnswer,
        onAnswerSelected: onBoolAnswerSelected,
      );
  }
}

class MultipleChoiceWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;
  const MultipleChoiceWidget({
    required this.question,
    required this.onAnswerSelected,
    required this.selectedAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 2.5,
        children: question.answers.map((answer) {
          final isSelected = answer == selectedAnswer;

          return GestureDetector(
            onTap: () => onAnswerSelected(answer),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.blue : AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.blue : AppColors.grey,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  answer,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontSize: 16,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TrueFalseWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final Function(bool) onAnswerSelected;
  final bool? selectedAnswer;

  const TrueFalseWidget({
    super.key,
    required this.question,
    required this.onAnswerSelected,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Кнопка "Правда" (true)
          Expanded(
            child: _buildAnswerCard(
              answer: question.answers[0],
              isSelected: selectedAnswer == true,
              onTap: () => onAnswerSelected(true),
            ),
          ),
          const SizedBox(width: 12),
          
          // Кнопка "Ложь" (false)
          Expanded(
            child: _buildAnswerCard(
              answer: question.answers[1],
              isSelected: selectedAnswer == false,
              onTap: () => onAnswerSelected(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerCard({
    required String answer,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.blue : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            answer,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class FillBlankWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final Function(String) onAnswerSelected;
  const FillBlankWidget({
    required this.question,
    required this.onAnswerSelected,
    super.key,
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
