enum AchievementType {
  module('module'),
  daily('daily');

  final String value;
  const AchievementType(this.value);

  factory AchievementType.fromString(String value) {
    return AchievementType.values.firstWhere((e) => e.value == value);
  }
}
