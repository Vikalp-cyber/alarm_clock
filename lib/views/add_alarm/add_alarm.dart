import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lin/bloc/alarm/alarm_bloc.dart';
import 'package:lin/components/widgets/text_field.dart';
import 'package:lin/utils/color.dart';
import 'package:lin/utils/size.dart';
import 'package:lin/utils/text.dart';
import 'package:lin/views/add_alarm/mp3_files.dart';
import 'package:lin/views/add_alarm/widget/custom_ringtone_container.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  int selectedHour = 0;
  int selectedMinute = 0;
  List<bool> selectedDays = List<bool>.filled(7, false);
  final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  final nameController = TextEditingController();
  bool vibrate = false;
  String? ringtonePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil.height(30),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hour Picker
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedHour = index;
                          });
                        },
                        itemExtent: 50,
                        perspective: 0.005,
                        overAndUnderCenterOpacity:
                            0.5, // Fade effect for non-centered items
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Text(
                                index.toString().padLeft(2, '0'),
                                style: TextStyle(
                                  fontSize: selectedHour == index ? 45 : 20,
                                  color: selectedHour == index
                                      ? MyColors.greenColor
                                      : MyColors.greenColor.withOpacity(0.6),
                                  fontWeight: selectedHour == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            );
                          },
                          childCount: 24,
                        ),
                      ),
                    ),
                    const Text(
                      ":",
                      style: TextStyle(
                          color: MyColors.greenColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    // Minute Picker
                    Expanded(
                      child: ListWheelScrollView.useDelegate(
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedMinute = index;
                          });
                        },
                        itemExtent: 50,
                        perspective: 0.005,
                        overAndUnderCenterOpacity:
                            0.5, // Fade effect for non-centered items
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Text(
                                index.toString().padLeft(2, '0'),
                                style: TextStyle(
                                  fontSize: selectedMinute == index ? 45 : 20,
                                  color: selectedMinute == index
                                      ? MyColors.greenColor
                                      : MyColors.greenColor.withOpacity(0.6),
                                  fontWeight: selectedMinute == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            );
                          },
                          childCount: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil.height(5),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(7, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDays[index] = !selectedDays[index];
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedDays[index]
                              ? MyColors.greenColor
                              : Colors.white,
                        ),
                        child: Text(
                          days[index],
                          style: TextStyle(
                              color: selectedDays[index]
                                  ? Colors.white
                                  : MyColors.greenColor),
                        ),
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: ScreenUtil.height(2),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(
                title: 'Name',
                controller: nameController,
              ),
            ),
             CustomRingtoneContainer(onRingtoneSelected: (path){
              setState(() {
                ringtonePath = path;
              });
             },),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.darkColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Vibrate",
                        style: MyText.body1,
                      ),
                      Switch(
                        value: vibrate,
                        onChanged: (value) {
                          setState(() {
                            vibrate = value;
                          });
                        },
                        activeColor: MyColors.greenColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<AlarmBloc>(context).add(SetAlarmEvent(
                hour: selectedHour,
                minute: selectedMinute,
                selectedDays: selectedDays,
                vibrate: vibrate,
                ringtonePath: ringtonePath!,
              ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: MyColors.darkColor, width: 2)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
