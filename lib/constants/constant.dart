import 'package:flutter/material.dart';

const kYellow = Color(0xFFE1B064);
const kLightGrey = Color(0xFFF0F0F0);
const kGrey = Color(0xFFE0E0E0);
const kGreyText = Color(0xFFABABAB);
const kGreyDarkText = Color(0xFF777777);
const kBlack = Color(0xFF000000);
const kWhite = Color(0xFFFFFFFF);
const kRed = Color(0xFFFF7070);

const kLightTextStyle =
    TextStyle(fontWeight: FontWeight.w300, fontFamily: 'Poppins', fontSize: 16);
const kRegularTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins', fontSize: 16);
const kMediumTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Poppins', fontSize: 16);
const kSemiBoldTextStyle =
    TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins', fontSize: 16);
const kBoldTextStyle =
    TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins', fontSize: 16);

InputDecoration basicInputDecoration(String title) {
  return InputDecoration(
    hintText: title,
    alignLabelWithHint: true,
    labelStyle: kRegularTextStyle.copyWith(color: kGreyDarkText),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.purple, width: 2),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: kGreyDarkText, width: 2),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: kGreyDarkText, width: 2),
    ),
  );
}
