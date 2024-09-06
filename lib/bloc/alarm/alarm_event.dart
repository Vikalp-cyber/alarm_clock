part of 'alarm_bloc.dart';

abstract class AlarmEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetAlarmEvent extends AlarmEvent {
  final int hour;
  final int minute;
  final List<bool> selectedDays;
  final bool vibrate;
  final String ringtonePath;

  SetAlarmEvent({
    required this.hour,
    required this.minute,
    required this.selectedDays,
    required this.vibrate,
    required this.ringtonePath,
  });
}