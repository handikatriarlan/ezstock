import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SharedLoading extends StatelessWidget {
  final Color? color;
  final Color? indincatorColor;
  const SharedLoading({
    super.key,
    this.color,
    this.indincatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: SizedBox(
          width: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: [indincatorColor ?? Colors.black],
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
