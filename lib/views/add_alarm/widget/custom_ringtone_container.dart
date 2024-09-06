import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lin/utils/color.dart';
import 'package:lin/utils/size.dart';
import 'package:lin/utils/text.dart';

class CustomRingtoneContainer extends StatefulWidget {
  final ValueChanged<String> onRingtoneSelected;
  const CustomRingtoneContainer({
    super.key,
    required this.onRingtoneSelected
  });

  @override
  State<CustomRingtoneContainer> createState() => _CustomRingtoneContainerState();
}

class _CustomRingtoneContainerState extends State<CustomRingtoneContainer> {
  String? ringtonePath;

  void pickRingtone() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio,);
    if(result != null){
      setState(() {
        ringtonePath = result.files.single.path;
      });
      widget.onRingtoneSelected(ringtonePath!);
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickRingtone,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ringtonePath == null ? 'Select Ringtone' : 'Ringtone Selected',
              style: TextStyle(
                color: ringtonePath == null ? Colors.white : MyColors.greenColor,
              ),
            ),
            const Icon(Icons.music_note, color: Colors.white),
          ],
        ),
      ),
    );
  }
}