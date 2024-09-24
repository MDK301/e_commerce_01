import 'package:e_commerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField() {
  return Column(
    children: [
      email.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: emailhint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      )
    ],
  );
}
