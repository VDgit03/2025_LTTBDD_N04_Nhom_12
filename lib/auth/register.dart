import 'package:flutter/material.dart';
import 'login.dart';

//biến toàn cục để lưu username, password
String? savedUS;
String? savedPW;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //lấy dữ liệu
  final USController = TextEditingController();
  final PWController = TextEditingController();

  //thực hiện khi ấn đăng kí
  void register() {
    setState(() {
      savedUS = USController.text;
      savedPW = PWController.text;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đăng kí thành công')));

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng kí tài khoản'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 105, 166, 215),
        elevation: 6,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 56, 56, 56),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: const Text(
                'Đã có tài khoản? Đăng nhập ngay',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Đăng kí',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
