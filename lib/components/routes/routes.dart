import 'package:flutter/material.dart';
import 'package:lin/views/add_alarm/add_alarm.dart';
import 'package:lin/views/homescreen/my_home_page.dart';

class MyRoutes{
  static const String homeScreen = '/alarmHomePage';
  static const String addAlarm = '/addAlarm';

  static final Map<String,WidgetBuilder> routes = {
    homeScreen: (context) =>  AlarmHomePage(),
    addAlarm: (context) => const AddAlarm(),
  };
}