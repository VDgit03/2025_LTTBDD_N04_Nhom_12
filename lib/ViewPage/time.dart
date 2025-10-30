import 'package:flutter/material.dart';
import 'dart:async';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  //chuoi thoi gian hien tai
  late String _timeString = '';
  //
  Timer? _timer;

  //khoi tao thoi gian
  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  // ham cap nhat thoi gian
  void _updateTime() {
    final String formattedDateTime = _formatDateTime(DateTime.now());
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  // ham lay thoi gian
  void _getTime() {
    if (!mounted) return; // kiem tra an toan khi goi setState
    final String formattedDateTime = _formatDateTime(DateTime.now());
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  // ham dinh dang thoi gian
  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  //ham xoa thoi gian
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 5, 21, 51)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time, size: 32),
          SizedBox(width: 8),
          Text(
            _timeString,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
