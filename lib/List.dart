import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Color> backgroungColor = [
  const Color(0xFFCCE5FF),
  const Color(0xFFD7F9E9),
  const Color(0xFFFFF8E1),
  const Color(0xFFF5E6CC),
  const Color(0xFFFFD6D6),
  const Color(0xFFE5E5E5),
  const Color(0xFFFFF0F0),
  const Color(0xFFE6F9FF),
  const Color(0xFFD4EDDA),
  const Color(0xFFFFF3CD),
];

SharedPreferences? sharepref;
List<String> dataList = [];
TextEditingController t1 = TextEditingController();