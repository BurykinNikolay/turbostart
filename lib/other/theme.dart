import 'package:flutter/material.dart';

ThemeData darkTheme(context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Color(0xff1f2124),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(colorScheme: ColorScheme.dark(), buttonColor: Colors.blue, splashColor: Colors.black),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}

ThemeData lightTheme(context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.transparent,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(colorScheme: ColorScheme.light(), buttonColor: Colors.blue, splashColor: Colors.white),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}

///colors

const Color white = Color(0xFFFFFFFF);
const Color white20 = Color(0x33FFFFFF);
const Color mainGreen = Color(0xFF98C222);
const Color darkGreen = Color(0xFF008F32);
const Color lightGreen = Color(0xFFC3E366);
const Color accentGreen = Color(0xFFADCE4E);
const Color red = Color(0xFFEB1E10);
const Color black = Color(0xFF161616);
const Color black20 = Color(0x33161616);
const Color gray = Color(0xFF868686);
const Color lightGray = Color(0xFFF9F9F9);
const Color accentGray = Color(0xFFE5E5E5);

///styles

const TextStyle boldMainStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: black);
const TextStyle descriptionStyle = TextStyle(fontSize: 17, color: black);
const TextStyle standartStyle = TextStyle(fontSize: 18, color: black);
const TextStyle standartStyleOpacity = TextStyle(fontSize: 18, color: black20);
const TextStyle normalGreyOpacity18 = TextStyle(fontSize: 18, color: gray);
const TextStyle normalWhite18 = TextStyle(fontSize: 18, color: white);
const TextStyle normalWhite16 = TextStyle(fontSize: 18, color: white);
const TextStyle normalGreen12 = TextStyle(fontSize: 12, color: mainGreen);
const TextStyle normalBlack12 = TextStyle(fontSize: 12, color: black);
const TextStyle normalBlack16 = TextStyle(fontSize: 16, color: black);

const TextStyle normalBlack18 = TextStyle(fontSize: 18, color: black);
const TextStyle normalGray18 = TextStyle(fontSize: 18, color: gray);

const TextStyle weight600White14 = TextStyle(fontSize: 14, color: white, fontWeight: FontWeight.w600);

const TextStyle boldWhite17 = TextStyle(fontSize: 17, color: white, fontWeight: FontWeight.w800);
const TextStyle boldWhite18 = TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.w800);
const TextStyle boldWhite20 = TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.w800);
const TextStyle boldWhite26 = TextStyle(fontSize: 26, color: white, fontWeight: FontWeight.w800);
const TextStyle boldWhite36 = TextStyle(fontSize: 36, color: white, fontWeight: FontWeight.w800);
const TextStyle boldWhite40 = TextStyle(fontSize: 40, color: white, fontWeight: FontWeight.w800);

const TextStyle boldBlack22 = TextStyle(fontSize: 22, color: black, fontWeight: FontWeight.w800);
const TextStyle boldBlack25 = TextStyle(fontSize: 25, color: black, fontWeight: FontWeight.w800);
const TextStyle boldRed22 = TextStyle(fontSize: 22, color: red, fontWeight: FontWeight.w800);
const TextStyle boldGreen20 = TextStyle(fontSize: 20, color: mainGreen, fontWeight: FontWeight.w800);
const TextStyle boldGreen40 = TextStyle(fontSize: 30, color: mainGreen, fontWeight: FontWeight.w800);
const TextStyle boldGray20 = TextStyle(fontSize: 20, color: gray, fontWeight: FontWeight.w800);

const TextStyle lightGreen16 = TextStyle(fontSize: 16, color: lightGreen, fontWeight: FontWeight.w300);
const TextStyle lightWhite18 = TextStyle(fontSize: 18, color: white, fontWeight: FontWeight.w300);


