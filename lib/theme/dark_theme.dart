import 'package:flutter/material.dart';

ThemeData darkTheme(){
   return ThemeData(
     brightness: Brightness.dark,
     scaffoldBackgroundColor: Colors.grey[800],
     appBarTheme: AppBarTheme(color: Colors.grey[600]),
   );
}