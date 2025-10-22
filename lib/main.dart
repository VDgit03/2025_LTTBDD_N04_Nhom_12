import 'package:flutter/material.dart';
import 'navigation.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do list',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MY_page_home(),
    );
  }
}

class MY_page_home extends StatelessWidget {
  const MY_page_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 166, 215),
        title: Text('To Do List', textAlign: TextAlign.center),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.language))],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //header của drawer
            const DrawerHeader(
              padding: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 105, 166, 215),
              ),
              child: Text(
                'Daily List',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Trang chủ'),
              onTap: () {
                // Đóng Drawer lại
                Navigator.pop(context);
                // Có thể thêm điều hướng tới Home nếu có nhiều trang
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 105, 166, 215),
                    content: Text(
                      'Đã tới Trang chủ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [dashboard(), navigation()]),
      ),
    );
  }
}
