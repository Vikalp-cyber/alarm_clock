import 'package:flutter/material.dart';
import 'package:lin/utils/color.dart';
import 'package:lin/utils/size.dart';

class AlarmDetailContainer extends StatelessWidget {
  const AlarmDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil.width(6), vertical: ScreenUtil.height(2)),
      decoration: BoxDecoration(
        color: MyColors.darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AM",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              Text(
                "08:00",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
