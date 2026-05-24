import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/domain/repositories/game_module_level_repository.dart';
import 'package:sugarlife/features/game_module/level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class GameQuestionPage extends StatefulWidget {
  const GameQuestionPage({super.key});

  @override
  State<GameQuestionPage> createState() => _GameQuestionPageState();
}

class _GameQuestionPageState extends State<GameQuestionPage> {
  String? _selectedStringAnswer;
  bool? _selectedBoolAnswer;
  List<int>? _selectedMultipleSelectAnswer;
  int? _lastQuestionId;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.watch<GameModuleLevelBloc>().state;

    int? currentQuestionId;
    int? currentCharacterId;
    GameModuleQuestionEntity? currentQuestion;
    if (state is ReceiveSuccess) {
      currentQuestion = state.questions[state.currentIndex];
      currentQuestionId = currentQuestion.id;
      currentCharacterId = currentQuestion.characterId;
    } else if (state is AnswerInProgress) {
      currentQuestion = state.question;
      currentQuestionId = currentQuestion.id;
      currentCharacterId = currentQuestion.characterId;
    }

    if (_lastQuestionId != currentQuestionId) {
      _lastQuestionId = currentQuestionId;
      _selectedStringAnswer = null;
      _selectedBoolAnswer = null;
      _selectedMultipleSelectAnswer = null;

    }
  }


  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameModuleLevelBloc>().state;
    final Map<int, String> characterImages = switch (state) {
    ReceiveSuccess s => s.characterImages,
    AnswerInProgress a => a.characterImages,
    _ => const {},
  };
    if (state is! ReceiveSuccess && state is! AnswerInProgress) {
      return const SizedBox.shrink();
    }
    final currentQuestion = state is ReceiveSuccess
        ? state.questions[state.currentIndex]
        : (state is AnswerInProgress ? state.question : null);
    final isAnswered = state is ReceiveSuccess ? state.isAnswered : true;
    final isAnswerInProgress = state is AnswerInProgress;
    final selectionLocked =
        isAnswerInProgress || (state is ReceiveSuccess && state.isAnswered);
    if (currentQuestion == null && !isAnswerInProgress) {
      return const SizedBox.shrink();
    }

    final hasSelectedAnswer =
        _selectedStringAnswer != null ||
        _selectedBoolAnswer != null ||
        (_selectedMultipleSelectAnswer?.isNotEmpty ?? false);
    final selectedAnswer =
        _selectedStringAnswer ??
        _selectedBoolAnswer ??
        _selectedMultipleSelectAnswer;
    return Scaffold(
      appBar: MainAppBar(
        title: currentQuestion?.levelId != null
            ? 'Уровень ${currentQuestion!.levelId}'
            : 'Объяснение',
      ),
      body: Stack(
        children: [
          if (currentQuestion != null)
            Column(
              children: [
                SizedBox(height: 100),
                _buildQuestionHeader(currentQuestion,characterImages),
                _buildAnswer(
                  currentQuestion,
                  selectionLocked: selectionLocked,
                  onStringAnswerSelected: (answer) {
                    if (selectionLocked) return;
                    setState(() => _selectedStringAnswer = answer);
                  },
                  onBoolAnswerSelected: (answer) {
                    if (selectionLocked) return;
                    setState(() => _selectedBoolAnswer = answer);
                  },
                  onMultipleSelectSelected: (indices) {
                    if (selectionLocked) return;
                    setState(() => _selectedMultipleSelectAnswer = indices);
                  },
                  selectedStringAnswer: _selectedStringAnswer,
                  selectedBoolAnswer: _selectedBoolAnswer,
                  selectedMultipleSelectAnswer: _selectedMultipleSelectAnswer,
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
              child: _buildExplantationOverlay(context, state),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestionHeader(GameModuleQuestionEntity question,Map<int, String> characterImages) {
    final imageUrl = characterImages[question.characterId];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: imageUrl != null ?
            SvgPicture.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const SizedBox(
                width: 80,
                height: 80,
                child: Center(child: Icon(Icons.error, color: Colors.red)),
              ),
            ) : const Center(child: LottieProgressIndicator(),),),
         
          const SizedBox(width: 12),
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

  Widget _buildExplantationOverlay(
    BuildContext context,
    AnswerInProgress state,
  ) {
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
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<GameModuleLevelBloc>().add(
                  GameModuleLevelEvent.nextQuestion(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Далее',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
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
      case QuestionType.multipleSelect:
        context.read<GameModuleLevelBloc>().add(
          GameModuleLevelEvent.answerMultipleSelect(
            selectedIndices: answer as List<int>,
          ),
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
    if (isAnswerInProgress) {
      return const SizedBox.shrink();
    }

    return ElevatedButton(
      onPressed: () {
        // В состоянии вопроса - можно нажать только если есть выбранный ответ и еще не отвечали
        if (hasSelectedAnswer && !isAnswered) {
          _handleAnswer(context, currentQuestionType, selectedAnswer);
        }
      },
      child: Text(isAnswerInProgress ? 'Далее' : 'Готово'),
    );
  }
}

Widget _buildAnswer(
  GameModuleQuestionEntity question, {
  required bool selectionLocked,
  required Function(String) onStringAnswerSelected,
  required Function(bool) onBoolAnswerSelected,
  required Function(List<int>) onMultipleSelectSelected,
  required String? selectedStringAnswer,
  required bool? selectedBoolAnswer,
  required List<int>? selectedMultipleSelectAnswer,
}) {
  switch (question.questionType) {
    case QuestionType.multipleChoice:
      return MultipleChoiceWidget(
        question: question,
        selectionLocked: selectionLocked,
        selectedAnswer: selectedStringAnswer,
        onAnswerSelected: onStringAnswerSelected,
      );
    case QuestionType.fillBlank:
      return FillBlankWidget(
        question: question,
        selectionLocked: selectionLocked,
        onAnswerSelected: onStringAnswerSelected,
      );
    case QuestionType.trueFalse:
      return TrueFalseWidget(
        question: question,
        selectionLocked: selectionLocked,
        selectedAnswer: selectedBoolAnswer,
        onAnswerSelected: onBoolAnswerSelected,
      );
    case QuestionType.multipleSelect:
      return MultipleSelectWidget(
        question: question,
        selectionLocked: selectionLocked,
        selectedIndices: selectedMultipleSelectAnswer,
        onAnswerSelected: onMultipleSelectSelected,
      );
  }
}

class MultipleChoiceWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final bool selectionLocked;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;
  const MultipleChoiceWidget({
    required this.question,
    required this.selectionLocked,
    required this.onAnswerSelected,
    required this.selectedAnswer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final useSingleColumn = question.answers.any(_isLongAnswer);

    if (useSingleColumn) {
      return Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: question.answers.map((answer) {
              final isSelected = answer == selectedAnswer;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildAnswerCard(
                  answer: answer,
                  isSelected: isSelected,
                  isCompact: false,
                ),
              );
            }).toList(),
          ),
        ),
      );
    }

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
          return _buildAnswerCard(
            answer: answer,
            isSelected: isSelected,
            isCompact: true,
          );
        }).toList(),
      ),
    );
  }

  bool _isLongAnswer(String answer) {
    final normalized = answer.trim();
    if (normalized.isEmpty) {
      return false;
    }
    final wordsCount = normalized.split(RegExp(r'\s+')).length;
    return wordsCount >= 2 || normalized.length > 16;
  }

  Widget _buildAnswerCard({
    required String answer,
    required bool isSelected,
    required bool isCompact,
  }) {
    return GestureDetector(
      onTap: selectionLocked ? null : () => onAnswerSelected(answer),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: isCompact ? 8 : 14,
        ),
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
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}

class TrueFalseWidget extends StatelessWidget {
  final GameModuleQuestionEntity question;
  final bool selectionLocked;
  final Function(bool) onAnswerSelected;
  final bool? selectedAnswer;

  const TrueFalseWidget({
    super.key,
    required this.question,
    required this.selectionLocked,
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
              onTap: selectionLocked ? null : () => onAnswerSelected(true),
            ),
          ),
          const SizedBox(width: 12),

          // Кнопка "Ложь" (false)
          Expanded(
            child: _buildAnswerCard(
              answer: question.answers[1],
              isSelected: selectedAnswer == false,
              onTap: selectionLocked ? null : () => onAnswerSelected(false),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerCard({
    required String answer,
    required bool isSelected,
    required VoidCallback? onTap,
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

class FillBlankWidget extends StatefulWidget {
  final GameModuleQuestionEntity question;
  final bool selectionLocked;
  final Function(String) onAnswerSelected;
  const FillBlankWidget({
    required this.question,
    required this.selectionLocked,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  State<FillBlankWidget> createState() => _FillBlankWidgetState();
}

class _FillBlankWidgetState extends State<FillBlankWidget> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            readOnly: widget.selectionLocked,
            decoration: InputDecoration(
              hintText: 'Введите ответ...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
              errorText: _errorText,
            ),
            onChanged: widget.selectionLocked
                ? null
                : (value) {
                    if (value.trim().isNotEmpty) {
                      setState(() => _errorText = null);
                      widget.onAnswerSelected(value.trim());
                    } else {
                      widget.onAnswerSelected('');
                    }
                  },
          ),
          const SizedBox(height: 8),
          Text(
            'Введите слово или фразу в поле выше',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

class MultipleSelectWidget extends StatefulWidget {
  final GameModuleQuestionEntity question;
  final bool selectionLocked;
  final Function(List<int>) onAnswerSelected;
  final List<int>? selectedIndices;

  const MultipleSelectWidget({
    super.key,
    required this.question,
    required this.selectionLocked,
    required this.onAnswerSelected,
    this.selectedIndices,
  });

  @override
  State<MultipleSelectWidget> createState() => _MultipleSelectWidgetState();
}

class _MultipleSelectWidgetState extends State<MultipleSelectWidget> {
  late Set<int> _selectedIndices;

  @override
  void initState() {
    super.initState();
    _selectedIndices = widget.selectedIndices?.toSet() ?? {};
  }

  @override
  void didUpdateWidget(MultipleSelectWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndices != oldWidget.selectedIndices) {
      _selectedIndices = widget.selectedIndices?.toSet() ?? {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(widget.question.answers.length, (index) {
            final isSelected = _selectedIndices.contains(index);
            return GestureDetector(
              onTap: widget.selectionLocked
                  ? null
                  : () {
                      setState(() {
                        if (isSelected) {
                          _selectedIndices.remove(index);
                        } else {
                          _selectedIndices.add(index);
                        }
                      });
                      widget.onAnswerSelected(_selectedIndices.toList());
                    },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? AppColors.blue : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.question.answers[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontSize: 16,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
