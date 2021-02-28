import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  // ...
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  Widget cornerRadius(BorderRadiusGeometry radius) {
    return ClipRRect(
      borderRadius: radius,
      child: this,
    );
  }

  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Hello, World!', style: Theme.of(context).textTheme.headline4)
//         .padding()
//         .background(Colors.lightBlue)
//         .cornerRadius(BorderRadius.all(Radius.circular(8.0)))
//         .padding(EdgeInsets.symmetric(horizontal: 8, vertical: 16))
//         .background(Colors.purple);
//   }
// }
