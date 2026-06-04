import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sugarlife/core/enum/question_type.dart';
import 'package:sugarlife/core/theme/app_color.dart';
import 'package:sugarlife/features/game_module/level/domain/entities/game_module_question_entity.dart';
import 'package:sugarlife/features/game_module/level/presentation/bloc/game_module_level_bloc.dart';
import 'package:sugarlife/shared/ui/lottie_progress_indicator.dart';
import 'package:sugarlife/shared/ui/main_app_bar.dart';

class GameQuestionPage extends StatefulWidget {
  final int levelOrderIndex;
  const GameQuestionPage({required this.levelOrderIndex, super.key});

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

    // Получаем текущий номер вопроса
    int currentQuestionNumber = 0;
    int totalQuestions = 0;
    if (state is ReceiveSuccess) {
      totalQuestions = state.questions.length;
      // Проверяем что currentIndex не -1 и не выходит за пределы
      if (state.currentIndex >= 0 && state.currentIndex < totalQuestions) {
        currentQuestionNumber = state.currentIndex + 1;
      }
    } else if (state is AnswerInProgress) {
      totalQuestions = state.questions.length;
      if (state.currentIndex >= 0 && state.currentIndex < totalQuestions) {
        currentQuestionNumber = state.currentIndex + 1;
      }
    }
    // URL персонажа следующего вопроса для предзагрузки в кэш
    String? _nextCharacterImageUrl;
    {
      final List<GameModuleQuestionEntity> questions;
      final int currentIndex;
      if (state is ReceiveSuccess) {
        questions = state.questions;
        currentIndex = state.currentIndex;
      } else if (state is AnswerInProgress) {
        questions = state.questions;
        currentIndex = state.currentIndex;
      } else {
        questions = const [];
        currentIndex = -1;
      }
      final nextIndex = currentIndex + 1;
      if (nextIndex < questions.length) {
        final nextCharacterId = questions[nextIndex].characterId;
        _nextCharacterImageUrl = characterImages[nextCharacterId];
      }
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MainAppBar(
        backgroundColor: AppColors.background,
        title: 'Уровень ${widget.levelOrderIndex}',
        titleColor: AppColors.blue,
        titleFontSize: 18,
        subtitle: 'Задание $currentQuestionNumber',
        iconColor: AppColors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: AppColors.blue,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          // Предзагрузка SVG следующего персонажа в кэш
          if (_nextCharacterImageUrl != null)
            Offstage(
              offstage: true,
              child: SvgPicture.network(
                key: ValueKey('preload_${_nextCharacterImageUrl}'),
                _nextCharacterImageUrl!,
                width: 1,
                height: 1,
              ),
            ),
          if (currentQuestion != null)
            Column(
              children: [
                SizedBox(height: 40),
                _buildQuestionHeader(currentQuestion, characterImages),
                SizedBox(height: 30),
                Expanded(
                  child: _buildAnswer(
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
                ),

                _buildButton(
                  context,
                  isAnswerInProgress,
                  hasSelectedAnswer,
                  currentQuestion.questionType,
                  selectedAnswer,
                  isAnswered,
                ),
                SizedBox(height: 40),
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

  Widget _buildQuestionHeader(
    GameModuleQuestionEntity question,
    Map<int, String> characterImages,
  ) {
    final imageUrl = characterImages[question.characterId];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: imageUrl != null
                ? SvgPicture.network(
                   key: ValueKey(question.characterId),
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  )
                : const Center(child: LottieProgressIndicator()),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Text(
              question.question,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.blue,
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
      decoration: BoxDecoration(
        color: state.isCorrect
            ? AppColors.backgroundGreen
            : AppColors.backgroundRed,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(
          top: BorderSide(
            color: state.isCorrect ? AppColors.green : AppColors.red,
            width: 6,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              state.isCorrect ? Icons.check_circle : Icons.cancel,
              color: state.isCorrect ? AppColors.green : AppColors.red,
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              state.isCorrect ? 'ПРАВИЛЬНО!' : 'НЕПРАВИЛЬНО',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: state.isCorrect ? AppColors.green : AppColors.red,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Объяснение:',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.blue,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '${state.explanation}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.blue,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Правильный ответ:',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: AppColors.blue,
              ),
            ),
            Text(
              '${state.correctAnswer}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  context.read<GameModuleLevelBloc>().add(
                    GameModuleLevelEvent.nextQuestion(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'ДАЛЕЕ',
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.background,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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

    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          if (hasSelectedAnswer && !isAnswered) {
            _handleAnswer(context, currentQuestionType, selectedAnswer);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue, 
          foregroundColor: AppColors.background, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          disabledBackgroundColor: AppColors.grey,
          disabledForegroundColor: AppColors.background,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            isAnswerInProgress ? 'ДАЛЕЕ' : 'ГОТОВО',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
        ),
      ),
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
      return SingleChildScrollView(
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
        childAspectRatio: 2,
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
          color: isSelected ? AppColors.blue : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.blue
                : Color.fromRGBO(220, 213, 205, 1),
            width: isSelected ? 3 : 2,
          ),
        ),
        child: Center(
          child: Text(
            answer.toLowerCase(),
            style: GoogleFonts.comme(
              color: isSelected ? AppColors.background : AppColors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
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
          color: isSelected ? AppColors.blue : AppColors.background,
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
              color: isSelected ? AppColors.background : Colors.black87,
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
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _focusNode.requestFocus(),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.blue,
                    width: 3,
                  ),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  readOnly: widget.selectionLocked,
                  style: GoogleFonts.comme(
                    color: AppColors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Введите ответ...',
                    hintStyle: GoogleFonts.comme(
                      color: AppColors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    errorText: _errorText,
                    errorStyle: GoogleFonts.rubik(
                      color: Colors.red,
                      fontSize: 12,
                    ),
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
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Введите слово или фразу в поле выше',
              style: GoogleFonts.rubik(
                fontSize: 12,
                color: AppColors.blue.withOpacity(0.7),
              ),
            ),
          ],
        ),
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
    return SingleChildScrollView(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.blue : AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.blue
                      : const Color.fromRGBO(220, 213, 205, 1),
                  width: 3,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: isSelected,
                      onChanged: widget.selectionLocked
                          ? null
                          : (_) {
                              setState(() {
                                if (isSelected) {
                                  _selectedIndices.remove(index);
                                } else {
                                  _selectedIndices.add(index);
                                }
                              });
                              widget.onAnswerSelected(
                                _selectedIndices.toList(),
                              );
                            },
                      fillColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.blue;
                        }
                        return Colors.transparent;
                      }),
                      checkColor: AppColors.background,
                      side: const BorderSide(color: AppColors.blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.question.answers[index],
                      style: GoogleFonts.comme(
                        color: isSelected
                            ? AppColors.background
                            : AppColors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
