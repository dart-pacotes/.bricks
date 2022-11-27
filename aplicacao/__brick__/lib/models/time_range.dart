import 'package:my_application_name/presentation/widgets/widgets.dart';

class TimeRange {
  final TimeOfDay from;

  final TimeOfDay to;

  const TimeRange({
    required this.from,
    required this.to,
  });

  Map<String, dynamic> toJson() {
    return {
      'start': '${from.hour}.${from.minute}',
      'end': '${from.hour}.${from.minute}',
    };
  }

  static TimeRange fromJson(final Map<String, dynamic> json) {
    final startTimeSplit = (json['start'] ?? 0).toString().split('.');
    final endTimeSplit = (json['end'] ?? 0).toString().split('.');

    return TimeRange(
      from: TimeOfDay(
        hour: int.parse(startTimeSplit.first),
        minute: int.parse(startTimeSplit.last).safeMinutes,
      ),
      to: TimeOfDay(
        hour: int.parse(endTimeSplit.first),
        minute: int.parse(endTimeSplit.last).safeMinutes,
      ),
    );
  }

  @override
  String toString() {
    return '${from.hour}:${from.minute} - ${to.hour}:${to.minute}';
  }

  String format(
    BuildContext context,
  ) {
    return '${from.format(context)} - ${to.format(context)}';
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode;

  @override
  bool operator ==(Object other) {
    return super.hashCode == other.hashCode;
  }
}

extension on int {
  int get safeMinutes {
    return this > 6 ? this : this * 10;
  }
}
