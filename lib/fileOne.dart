import 'dart:ffi';

import 'package:flutter/material.dart';
class one extends StatefulWidget {
  const one({super.key});

  @override
  State<one> createState() => _oneState();
}

class _oneState extends State<one> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red),

    );
  }
}
