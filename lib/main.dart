//KARKALA SRINIVASA VENKATARAMANA
//OM JAI DURGE MAA

import 'package:flutter/material.dart';
import 'package:rail_book/presentation/views/seat_find_screen.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RailBook",
      theme: ThemeData(
        fontFamily: "Dongle",
      ),
      home: const FindScreen(),
    ),
  );
}
