import 'package:flutter/material.dart';
import 'navigation.dart';
import 'dashboard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 166, 215),
        toolbarHeight: 60,
        title: Text('To Do List', textAlign: TextAlign.center),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.language)),
          Padding(padding: EdgeInsets.only(right: 10)),
        ],
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
            // link trang chủ
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
            ListTile(),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(children: [dashboard(), navigation_dashboard()]),
      ),
    );
  }
}
