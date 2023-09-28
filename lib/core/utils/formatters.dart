import 'package:flutter/material.dart';

class Formatter {
  static String formatCurrency(double value) {
    return value.toStringAsFixed(2);
  }

  static String formatPercentage(double value) {
    return value.toStringAsFixed(2);
  }

  static String formatNumber(double value) {
    return value.toStringAsFixed(2);
  }

  static String formatDateTime(DateTime dateTime) {
    return dateTime.toString();
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    return timeOfDay.toString();
  }

  static String formatDuration(Duration duration) {
    return duration.toString();
  }

  static String formatString(String value) {
    return value;
  }

  static String formatBool(bool value) {
    return value.toString();
  }

  static String formatInt(int value) {
    return value.toString();
  }
}
