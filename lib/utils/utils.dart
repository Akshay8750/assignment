import 'package:flutter/material.dart';

double convertDollarToRupee(num dollarAmount, {double exchangeRate = 83.75}) {
  return dollarAmount * exchangeRate;
}


double calculateOriginalValue(num discountedValue, num discountPercentage) {
  if (discountPercentage < 0 || discountPercentage > 100) {
    throw ArgumentError('Discount percentage must be between 0 and 100.');
  }

  double discountFraction = discountPercentage / 100;

  double originalValue = discountedValue / (1 - discountFraction);
  return convertDollarToRupee(originalValue);
  
}


extension Separation on List<Widget> {
  ///add vertical gap between widgets
  List<Widget> separateVertically(double gap) {
    final separatedWidgets = <Widget>[];

    for (var i = 0; i < length; i++) {
      separatedWidgets.add(this[i]);
      if (i < length - 1) {
        separatedWidgets.add(SizedBox(height: gap));
      }
    }

    return separatedWidgets;
  }

  ///add horizontal gap between widgets
  List<Widget> separateHorizontally(double gap) {
    final separatedWidgets = <Widget>[];

    for (var i = 0; i < length; i++) {
      separatedWidgets.add(this[i]);
      if (i < length - 1) {
        separatedWidgets.add(SizedBox(width: gap));
      }
    }

    return separatedWidgets;
  }
}
