import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  const ResuableCard({required this.cardColour, required this.cardChild, required this.cardPressed});
  final Color cardColour;
  final Widget cardChild;
  final VoidCallback cardPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardPressed,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColour,
        ),
        child: cardChild,
      ),
    );
  }
}
