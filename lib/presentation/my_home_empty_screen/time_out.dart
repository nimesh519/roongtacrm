import 'package:flutter/material.dart';

class TimeoutWidget extends StatelessWidget {
  const TimeoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Timeout occurred. Please try again.',
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}