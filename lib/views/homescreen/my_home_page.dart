import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlarmHomePage extends StatefulWidget {
  @override
  _AlarmHomePageState createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<AlarmHomePage> {
  static const platform = MethodChannel('com.example.alarm/clock');

  TimeOfDay _alarmTime = TimeOfDay.now();
  String _status = 'No alarm set';

  Future<void> _setAlarm() async {
    try {
      final int result = await platform.invokeMethod('setAlarm', {
        'hour': _alarmTime.hour,
        'minute': _alarmTime.minute,
      });
      setState(() {
        _status = 'Alarm set for ${_alarmTime.format(context)}';
      });
    } on PlatformException catch (e) {
      setState(() {
        _status = 'Failed to set alarm: ${e.message}';
      });
    }
  }

  Future<void> _cancelAlarm() async {
    try {
      await platform.invokeMethod('cancelAlarm');
      setState(() {
        _status = 'Alarm canceled';
      });
    } on PlatformException catch (e) {
      setState(() {
        _status = 'Failed to cancel alarm: ${e.message}';
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _alarmTime,
    );
    if (picked != null && picked != _alarmTime) {
      setState(() {
        _alarmTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alarm Clock'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Current Alarm Status:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                _status,
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: Text('Select Alarm Time'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _setAlarm,
                child: Text('Set Alarm'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _cancelAlarm,
                child: Text('Cancel Alarm'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
        ));
  }
}