import 'package:flutter/material.dart';

class Transaction {
  String title;
  DateTime date;
  double amount = 0;
  Transaction({required this.title, required this.date, required this.amount});
}
