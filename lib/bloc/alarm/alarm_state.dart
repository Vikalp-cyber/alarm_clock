part of 'alarm_bloc.dart';

class AlarmState extends Equatable {
  final int hour;
  final int minute;
  final List<bool> selectedDays;
  final bool vibrate;
  final String ringtonePath;

  const AlarmState({
    required this.hour,
    required this.minute,
    required this.selectedDays,
    required this.vibrate,
    required this.ringtonePath,
  });

  @override
  List<Object> get props => [hour, minute, selectedDays, vibrate, ringtonePath];

  AlarmState copyWith({
    int? hour,
    int? minute,
    List<bool>? selectedDays,
    bool? vibrate,
    String? ringtonePath,
  }) {
    return AlarmState(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      selectedDays: selectedDays ?? this.selectedDays,
      vibrate: vibrate ?? this.vibrate,
      ringtonePath: ringtonePath ?? this.ringtonePath,
    );
  }
}