import 'package:flutter/material.dart';

class SaveData {
  static final SaveData _instance = SaveData._internal();
  factory SaveData() => _instance;
  SaveData._internal();

  //quan ly ngay thang
  // final TextEditingController selectedDate = TextEditingController();
  final Map<int, String> dates = {};

  //luu todo list theo so trang
  final Map<int, List<Map<String, dynamic>>> tasks = {};

  //luu nhat ky theo so trang
  final Map<int, String> diaries = {};

  //phương thức để thêm, lấy và xóa nhật ký
  void saveDiary(int pageNumber, String text) {
    diaries[pageNumber] = text;
  }

  String getDiary(int pageNumber) {
    return diaries[pageNumber] ?? "";
  }

  void clearDiary(int pageNumber) {
    diaries.remove(pageNumber);
  }

  //phương thức để thêm, lấy và xóa todolist
  void saveTasks(int pageNumber, List<Map<String, dynamic>> taskList) {
    tasks[pageNumber] = List.from(taskList);
  }

  List<Map<String, dynamic>> getTasks(int pageNumber) {
    return tasks[pageNumber] ?? [];
  }

  void clearTasks(int pageNumber) {
    tasks.remove(pageNumber);
  }

  //phương thức để thêm, lấy và xóa ngày tháng
  void saveDate(int pageNumber, String date) {
    dates[pageNumber] = date;
  }

  String getDate(int pageNumber) {
    return dates[pageNumber] ?? "";
  }

  void clearDate(int pageNumber) {
    dates.remove(pageNumber);
  }
}
