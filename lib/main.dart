// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lin/bloc/alarm/alarm_bloc.dart';
import 'package:lin/components/alarm_task.dart';
import 'package:lin/components/routes/routes.dart';
import 'package:lin/utils/size.dart';
import 'package:lin/views/homescreen/my_home_page.dart';
import 'package:workmanager/workmanager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocProvider(
      create: (context) => AlarmBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: MyRoutes.routes,
        initialRoute: MyRoutes.homeScreen,
      ),
    );
  }
}
