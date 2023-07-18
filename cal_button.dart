import 'package:flutter/material.dart';

class CalButton extends StatelessWidget {
  final String Buttontitle;
  final Color Buttoncolor;
  final VoidCallback onPress;

  CalButton({
    super.key,
    required this.Buttontitle,
    this.Buttoncolor = const Color(0xff4B4B4B),
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Buttoncolor,
            ),
            child: Center(
              child: Text(
                Buttontitle,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
