import 'package:flutter/material.dart';
import 'package:mobile_ck/auth/register.dart';
import 'package:mobile_ck/homepage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //header của drawer
          DrawerHeader(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(username: savedUS!),
                ),
              );
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
    );
  }
}
