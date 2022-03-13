import 'package:flutter/material.dart';

extension ColorExtension on Color {

  String toColorString() => '#${value.toRadixString(16).padLeft(8, '0').substring(2,8)}';
}