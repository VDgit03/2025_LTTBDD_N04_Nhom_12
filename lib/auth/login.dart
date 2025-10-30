import 'package:flutter/material.dart';
import 'register.dart';
import 'package:mobile_ck/Home/homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final USController = TextEditingController();
  final PWController = TextEditingController();
  void login() {
    //kiểm tra username, password
    if (USController.text == savedUS && PWController.text == savedPW) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage(username: savedUS!)),
      );
    } else {
      //sai thì báo lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 105, 166, 215),
          content: Text(
            'Sai tên đăng nhập hoặc mật khẩu! Vui lòng nhập lại!',
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color.fromARGB(255, 56, 56, 56),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 100, right: 100, top: 20),
        child: Column(
          children: [
            TextField(
              controller: USController,
              decoration: InputDecoration(
                labelText: 'Tên đăng nhập',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: PWController,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text(
                'Chưa có tài khoản? Đăng kí ngay!',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
