import 'package:flutter/material.dart';

class SaveData {
  static final SaveData _instance = SaveData._internal();
  factory SaveData() => _instance;
  SaveData._internal();

  //danh sach task
  List<Map<String, dynamic>> tasks = [];

  //quan ly ngay thang
  final TextEditingController selectedDate = TextEditingController();

  //luu nhat ky theo so trang
  Map<int, String> diaries = {};

  //luu todo list theo so trang
  Map<int, List<String>> todoLists = {};

  void saveDiary(int pageNumber, String text) {
    diaries[pageNumber] = text;
  }

  String getDiary(int pageNumber) {
    return diaries[pageNumber] ?? "";
  }

  void clearDiary(int pageNumber) {
    diaries.remove(pageNumber);
  }
}
