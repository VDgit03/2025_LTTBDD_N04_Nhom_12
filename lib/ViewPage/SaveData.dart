import 'package:flutter/material.dart';

class SaveData {
  static final SaveData _instance = SaveData._internal();
  factory SaveData() {
    return _instance;
  }

  SaveData._internal();
  List<Map<String, dynamic>> tasks = [];

  final TextEditingController selectedDate = TextEditingController();

  String diary = "";
  void saveDiary(String text) {
    diary = text;
  }

  void clearDiary() {
    diary = "";
  }
}
