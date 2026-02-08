enum QuestionType {
  multipleChoice('multiple_choice'),
  trueFalse('true_false'),
  fillBlank('fill_blanc');

  final String value;
  const QuestionType(this.value);

  factory QuestionType.fromString(String value) {
    return QuestionType.values.firstWhere(
      (e) => e.value == value,
    );
  }
}
