enum AgeCategory {
  child('child'),
  teen('teen'),
  adult('adult');

  final String value;
  const AgeCategory(this.value);

  factory AgeCategory.fromString(String value) {
    return AgeCategory.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AgeCategory.child,
    );
  }

}
