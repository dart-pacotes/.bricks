class TimePeriod {
  final DateTime start;

  final DateTime end;

  const TimePeriod({
    required this.start,
    required this.end,
  });

  bool within(final DateTime dateTime) {
    return start.isBefore(dateTime) && end.isAfter(dateTime);
  }

  static TimePeriod fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      start: DateTime.fromMillisecondsSinceEpoch(json['startMS']),
      end: DateTime.fromMillisecondsSinceEpoch(json['endMS']),
    );
  }
}
