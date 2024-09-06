// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:workmanager/workmanager.dart';

part 'alarm_event.dart';
part 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc()
      : super(const AlarmState(
            hour: 0,
            minute: 0,
            selectedDays: [false, false, false, false, false, false, false],
            vibrate: false,
            ringtonePath: '')) {
    on<SetAlarmEvent>((event, emit) {
      final updatedState = state.copyWith(
          hour: event.hour,
          minute: event.minute,
          selectedDays: event.selectedDays,
          vibrate: event.vibrate,
          ringtonePath: event.ringtonePath);
      emit(updatedState);
      _scheduleAlarm(updatedState);
    });
  }

  void _scheduleAlarm(AlarmState alarmState) {
    DateTime now = DateTime.now();
    print("task registered");

    DateTime alarmTime = DateTime(
        now.year, now.month, now.day, alarmState.hour, alarmState.minute);
    if (alarmTime.isBefore(now)) {
      print("task registered");

      alarmTime = alarmTime.add(const Duration(days: 1));
    }
    
    Workmanager().registerOneOffTask("alarmTask", "alarmTask",
        initialDelay: alarmTime.difference(now),
        inputData: {
          'ringtonePath': alarmState.ringtonePath,
        });
  }
}
