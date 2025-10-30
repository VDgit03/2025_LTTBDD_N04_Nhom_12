import 'package:flutter/material.dart';
import 'package:mobile_ck/Home/homepage.dart';
import 'package:mobile_ck/auth/login.dart';
import 'Setting.dart';
import 'About.dart';

class MyDrawer extends StatelessWidget {
  final String username;
  const MyDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //header của drawer
          DrawerHeader(
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 105, 166, 215),
            ),
            child: Column(
              children: [
                Icon(Icons.person, size: 70, color: Colors.white),
                SizedBox(height: 10),
                Text('$username', style: TextStyle(fontSize: 25)),
              ],
            ),
          ),

          // link trang chủ
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Trang chủ'),
            onTap: () {
              // Đóng Drawer lại
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(username: username),
                ),
              );
              // Có thể thêm điều hướng tới Home nếu có nhiều trang
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
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
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    'Đã tới Cài Đặt',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Giới thiệu'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    'Đã tới Giới Thiệu',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Đăng xuất'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Color.fromARGB(255, 105, 166, 215),
                  content: Text(
                    'Đã đăng xuất',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
