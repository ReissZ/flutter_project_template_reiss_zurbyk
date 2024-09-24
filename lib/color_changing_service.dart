import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangingService {

  //Rndm color generator
  Color generateRandomColor() {
    return Color(0xFF000000 + Random().nextInt(0x00FFFFFF));
  }
}