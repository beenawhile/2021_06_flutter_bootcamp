import 'package:flutter/material.dart';

abstract class Pizza {
  @protected
  late String description;

  String getDescription();
  double getPrice();
}
