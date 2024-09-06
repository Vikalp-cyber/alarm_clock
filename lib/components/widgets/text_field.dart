import 'package:flutter/material.dart';
import 'package:lin/utils/color.dart';
import 'package:lin/utils/text.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final controller;
  const CustomTextField(
      {super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: title,
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none),
          hintStyle: MyText.body1,
          filled: true,
          fillColor: MyColors.darkColor,
        ),
      ),
    );
  }
}
