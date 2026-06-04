enum QuestionType {
  multipleChoice('multiple_choice'),
  multipleSelect('multiple_select'),
  trueFalse('true_false'),
  fillBlank('fill_blank');

  final String value;
  const QuestionType(this.value);

  factory QuestionType.fromString(String value) {
    return QuestionType.values.firstWhere(
      (e) => e.value == value,
    );
  }

  static QuestionType parseLoose(String? value) {
    if (value == null || value.isEmpty) {
      return QuestionType.multipleChoice;
    }
    for (final e in QuestionType.values) {
      if (e.value == value) return e;
    }
    return QuestionType.multipleChoice;
  }
}
