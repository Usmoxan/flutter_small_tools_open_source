import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Color color1;
  final Color color2;
  final bool isLinearStyle;
  final Alignment begin;
  final Alignment end;

  const GradientContainer({
    super.key,
    required this.color1,
    required this.color2,
    required this.isLinearStyle,
    required this.begin,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(25),
            gradient: isLinearStyle
                ? LinearGradient(
                    colors: [
                      color1,
                      color2,
                    ],
                    begin: begin,
                    end: end,
                  )
                : RadialGradient(
                    colors: [
                      color1,
                      color2,
                    ],
                    center: begin,
                    radius: 0.8,
                  ),
          ),
        ),
      ),
    );
  }
}
