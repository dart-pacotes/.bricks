enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  static DayOfWeek fromJson(int value) {
    return DayOfWeek.values[value];
  }
}
