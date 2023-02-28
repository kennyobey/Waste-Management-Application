import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:halal_design/screens/constants/color.dart';

class Card extends StatefulWidget {
  const Card({super.key});

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().backGround,
    );
  }
}
