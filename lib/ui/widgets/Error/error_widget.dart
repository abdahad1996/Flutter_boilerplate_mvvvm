import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final double fontsize;
  const CustomErrorWidget({Key key, this.message, this.fontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontsize,
        ),
      ),
    );
  }
}
